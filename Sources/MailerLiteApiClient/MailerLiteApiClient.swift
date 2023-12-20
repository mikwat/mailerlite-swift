//
//  MailerLiteAPIClient.swift
//
//
//  Created by Michael Watts on 12/18/23.
//

import Foundation

public class MailerLiteAPIClient: APIClient {
    private let baseEndpointUrl = URL(string: "https://connect.mailerlite.com/api/")!
    private let urlSession: URLSession
    
    private let apiKey: String
    
    public init(apiKey: String, urlSession: URLSession = URLSession(configuration: .default)) {
        self.apiKey = apiKey
        self.urlSession = urlSession
    }
    
    public func send<T: APIRequest>(_ request: T, completion: @escaping ResultCallback<T.Response>) -> Void {
        let endpoint = self.endpoint(for: request)
        var urlRequest = URLRequest(url: endpoint)
        urlRequest.httpMethod = request.method.rawValue.uppercased()
        urlRequest.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
        if request.method == .post {
            do {
                urlRequest.httpBody = try JSONEncoder().encode(request)
            } catch {
                return completion(.failure(APIClientError.encoding))
            }
        }
        
        let task = urlSession.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let httpResponse = response as! HTTPURLResponse
                    switch httpResponse.statusCode {
                    case 200...299:
                        let apiResponse = try JSONDecoder().decode(T.Response.self, from: data)
                        completion(.success(apiResponse))
                    default:
                        let apiErrorResponse = try JSONDecoder().decode(APIErrorResponse.self, from: data)
                        completion(.failure(APIClientError.response(apiErrorResponse)))
                    }
                } catch {
                    completion(.failure(error))
                }
            } else {
                completion(.failure(APIClientError.unknownResponse))
            }
        }
        task.resume()
    }
    
    private func endpoint<T: APIRequest>(for request: T) -> URL {
        guard let baseUrl = URL(string: request.resourceName, relativeTo: baseEndpointUrl) else {
            fatalError("Bad resourceName: \(request.resourceName)")
        }
        
        if request.method != .get {
            return baseUrl
        }
        
        var components = URLComponents(url: baseUrl, resolvingAgainstBaseURL: true)!
        let queryItems: [URLQueryItem]
        do {
            queryItems = try URLQueryItemEncoder.encode(request)
        } catch {
            fatalError("Wrong parameters: \(error)")
        }
        components.queryItems = queryItems
        
        return components.url!
    }
}
