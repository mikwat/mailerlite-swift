//
//  UpsertSubscriberTest.swift
//  
//
//  Created by Michael Watts on 12/19/23.
//

import Foundation
import XCTest
@testable import MailerLiteAPIClient

final class UpsertSubscriberTest: XCTestCase {
    var apiClient: MailerLiteAPIClient!
    var expectation: XCTestExpectation!
    let apiKey = "abc123"
    
    override func setUp() async throws {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]
        
        let urlSession = URLSession.init(configuration: configuration)
        apiClient = MailerLiteAPIClient(apiKey: apiKey, urlSession: urlSession)
        expectation = expectation(description: "Expectation")
    }
    
    func testSuccess() async {
        let jsonString = """
            {
              "data": {
                "id": "31897397363737859",
                "email": "dummy@example.com",
                "status": "active",
                "source": "api",
                "sent": 0,
                "opens_count": 0,
                "clicks_count": 0,
                "open_rate": 0,
                "click_rate": 0,
                "ip_address": null,
                "subscribed_at": "2021-08-31 14:22:08",
                "unsubscribed_at": null,
                "created_at": "2021-08-31 14:22:08",
                "updated_at": "2021-08-31 14:22:08",
                "fields": {
                  "city": null,
                  "company": null,
                  "country": null,
                  "last_name": "Testerson",
                  "name": "Dummy",
                  "phone": null,
                  "state": null,
                  "z_i_p": null
                },
                "groups": [],
                "opted_in_at": null,
                "optin_ip": null
              }
            }
        """
        let data = jsonString.data(using: .utf8)
        let apiURL = URL(string: "https://connect.mailerlite.com/api/subscribers")!
        MockURLProtocol.requestHandler = { request in
            guard let url = request.url, url == apiURL else {
                throw MockAPIError.request
            }
            
            let response = HTTPURLResponse(url: apiURL, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (response, data)
        }
        
        do {
            let response = try await apiClient.send(UpsertSubscriber(email: "dummy@example.com"))
            XCTAssertNotNil(response.data)
            XCTAssertEqual(response.data?.email, "dummy@example.com")
            XCTAssertEqual(response.data?.fields?.lastName, "Testerson")
        } catch {
            XCTFail("Error was not expected: \(error)")
        }
        
        self.expectation.fulfill()
        await fulfillment(of: [expectation], timeout: 1.0)
    }
    
    func testFailure() async {
        let jsonString = """
            {
              "message": "The given data was invalid.",
               "errors": {
                 "email": ["The email must be a valid email address."]
               }
            }
        """
        let data = jsonString.data(using: .utf8)
        let apiURL = URL(string: "https://connect.mailerlite.com/api/subscribers")!
        MockURLProtocol.requestHandler = { request in
            guard let url = request.url, url == apiURL else {
                throw MockAPIError.request
            }
            
            let response = HTTPURLResponse(url: apiURL, statusCode: 422, httpVersion: nil, headerFields: nil)!
            return (response, data)
        }
        
        do {
            let response = try await apiClient.send(UpsertSubscriber(email: "dummy.example.com"))
            XCTFail("Success was not expected: \(response)")
        } catch {
            guard let apiError = error as? APIClientError else {
                XCTFail("Incorrect error received.")
                self.expectation.fulfill()
                return
            }
            
            switch apiError {
            case .response(let response):
                XCTAssertEqual(response.message, "The given data was invalid.")
            default:
                XCTFail("Incorrect error received.")
            }
        }
        
        self.expectation.fulfill()
        await fulfillment(of: [expectation], timeout: 1.0)
    }
}
