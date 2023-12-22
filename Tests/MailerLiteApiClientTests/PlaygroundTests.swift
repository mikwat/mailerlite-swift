// DO NOT COMMIT CHANGES TO THIS FILE

import XCTest
@testable import MailerLiteAPIClient

final class PlaygroundTests: XCTestCase {
    let apiKey = """
eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI0IiwianRpIjoiZDUxOGRmYTEyZGIwMzNhMDQ2Nzk0ZmU0ZjA5NWU4MDc0YTk2YThkMDE1N2UzZTA2YzlhODM3OGM4MDNmZDA0OTlmZGZkM2UyZjMyM2Y1MzYiLCJpYXQiOjE3MDI5Mjg4NTcuNDk3MDg5LCJuYmYiOjE3MDI5Mjg4NTcuNDk3MDkxLCJleHAiOjQ4NTg2MDI0NTcuNDkyODU5LCJzdWIiOiI3NDAxMjYiLCJzY29wZXMiOltdfQ.a8KnpvjFu4SdMOCs0aFUUunF5_4h1NTehpKzRlVo3-uCXqnS8wBNblohrwEGInbyHj1bzutWAUXUVq7EAfImtAdm3hL4ocV6U08JI_i9ldoeGQDYSWtaC6Y1z5U_j7RhP4KlZ0v8tLgrCDdjuRfZq5LjfmTkLSNf0Ow4Pl4tAhDS0Cmb-VlZCQDgCn9ztyrNQH5ewHI7PgUFns2wdZW6CeYSErW_jFug3KhRuCB-0iHhq_s2EIBiiCKIf19vCruwzBKXKIConnNarSl6_Q2Gu2NkLeo01MMxyW1ID2h0b55LUqDEpaYLlcCYlDsRtt_otwuD0Bw3eDPeAMGbkyDa-wn5-475hNkRo8NdVfWtuiP9J9UnNg072Ezj4hqab5DmWhtAf8Uie6wGmaWJaY1y1X1Sc-okFKbMrtP1Al0u4DXeR0KAswGPTfgySxaMHDJZH50QC5Jhx1xDfl6eb3r2lko1ATgznuHzSOAgQudacxrOXU62jejxIjeroNcyIpOY3BqBineVU_adcgl2PwOk__hPdoFfJsFB2S1NjfkCs9Hr1nw41bTemApPIMTikka9nuJmd4cg6trpJiSyjAaN0SU5gAXDNeDZeuJSPe_FUVTXJpJXfgRmc_SKexy94Vpo2UwqX_NebrpSGv0xYNZqZL3mSmBvGXBXQQZUq42JnEo
"""
    var apiClient: MailerLiteAPIClient!
    var expectation: XCTestExpectation!
    
    override func setUp() async throws {
        apiClient = MailerLiteAPIClient(apiKey: apiKey)
        expectation = expectation(description: "Expectation")
    }
    
//    func testListSubscribers() async throws {
//        let response = await withCheckedContinuation { continuation in
//            apiClient.send(ListSubscribers()) { response in
//                continuation.resume(returning: response)
//            }
//        }
//        
//        do {
//            let listResponse = try response.get()
//            if let subscribers = listResponse.data {
//                print("Found \(subscribers.count) subscribers")
//                for subscriber in subscribers {
//                    print("Subscriber: \(subscriber)")
//                }
//            } else {
//                print("No subscribers found")
//            }
//            
//            print("Links: \(listResponse.links)")
//            print("Meta: \(listResponse.meta)")
//        } catch {
//            print("Error: \(error)")
//        }
//    }
    
//    func testUpsertSubscribers() {
//        apiClient.send(UpsertSubscriber(email: "elegant.joy3337-at-awattslife.com")) { result in
//            switch result {
//            case .success(let response):
//                XCTFail("Success was not expected: \(response)")
//            case .failure(let error):
//                if let apiError = error as? APIClientError {
//                    switch apiError {
//                    case .response(let response):
//                        print("Error response: \(response)")
//                    default:
//                        print("Error: \(error.localizedDescription)")
//                    }
//                } else {
//                    print("Error: \(error.localizedDescription)")
//                }
//            }
//            self.expectation.fulfill()
//        }
//        wait(for: [expectation], timeout: 5.0)
//    }
}
