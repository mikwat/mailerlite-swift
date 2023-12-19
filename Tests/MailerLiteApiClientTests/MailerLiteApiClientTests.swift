import XCTest
@testable import MailerLiteApiClient

enum APIResponseError: Error {
    case request
}

final class MailerLiteApiClientTests: XCTestCase {
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
    
    func testListSubscribersSuccess() {
        let jsonString = """
            {
              "data": [
                {
                  "id": "31986843064993537",
                  "email": "dummy@example.com",
                  "status": "active",
                  "source": "api",
                  "sent": 0,
                  "opens_count": 0,
                  "clicks_count": 0,
                  "open_rate": 0,
                  "click_rate": 0,
                  "ip_address": null,
                  "subscribed_at": "2021-09-01 14:03:50",
                  "unsubscribed_at": null,
                  "created_at": "2021-09-01 14:03:50",
                  "updated_at": "2021-09-01 14:03:50",
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
              ],
              "links": {
                "first": null,
                "last": null,
                "prev": "https://connect.mailerlite.com/api/subscribers?cursor=eyJpZCI6NzI1ODIxNjQ2NDU5Mzg1NTksIl9wb2ludHNUb05leHRJdGVtcyI6ZmFsc2V9",
                "next": "https://connect.mailerlite.com/api/subscribers?cursor=eyJpZCI6NzI1ODIxNjQ2NDY5ODcxMzYsIl9wb2ludHNUb05leHRJdGVtcyI6dHJ1ZX0"
              },
              "meta": {
                "path": "https://connect.mailerlite.com/api/subscribers",
                "per_page": 25,
                "next_cursor": "eyJpZCI6NzI1ODIxNjQ2NDY5ODcxMzYsIl9wb2ludHNUb05leHRJdGVtcyI6dHJ1ZX0",
                "prev_cursor": "eyJpZCI6NzI1ODIxNjQ2NDU5Mzg1NTksIl9wb2ludHNUb05leHRJdGVtcyI6ZmFsc2V9"
              }
            }
        """
        let data = jsonString.data(using: .utf8)
        let apiURL = URL(string: "https://connect.mailerlite.com/api/subscribers?")!
        MockURLProtocol.requestHandler = { request in
            guard let url = request.url, url == apiURL else {
                throw APIResponseError.request
            }
            
            let response = HTTPURLResponse(url: apiURL, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (response, data)
        }
        
        apiClient.send(ListSubscribers()) { result in
            switch result {
            case .success(let response):
                XCTAssertEqual(response.data?.count, 1)
                XCTAssertEqual(response.data?.first?.email, "dummy@example.com")
            case .failure(let error):
                XCTFail("Error was not expected: \(error)")
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testListSubscribersFailure() {
        let data = Data()
        let apiURL = URL(string: "https://connect.mailerlite.com/api/subscribers?")!
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(url: apiURL, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (response, data)
        }
        
        apiClient.send(ListSubscribers()) { result in
            switch result {
            case .success(_):
                XCTFail("Success was not expected.")
            case .failure(let error):
                guard let error = error as? APIClientError else {
                    XCTFail("Incorrect error received.")
                    self.expectation.fulfill()
                    return
                }
                
                XCTAssertEqual(error, APIClientError.parsing, "Parsing error was expected")
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testUpsertSubscribers() {
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
                throw APIResponseError.request
            }
            
            let response = HTTPURLResponse(url: apiURL, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (response, data)
        }
        
        apiClient.send(UpsertSubscriber(email: "dummy@example.com")) { result in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response.data)
                XCTAssertEqual(response.data?.email, "dummy@example.com")
                XCTAssertEqual(response.data?.fields?.lastName, "Testerson")
            case .failure(let error):
                XCTFail("Error was not expected: \(error)")
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }
}
