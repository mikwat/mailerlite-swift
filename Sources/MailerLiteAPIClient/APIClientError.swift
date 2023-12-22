//
//  APIClientError.swift
//  
//
//  Created by Michael Watts on 12/18/23.
//

import Foundation

enum APIClientError: Error, Equatable {
    case decoding, encoding, unknownResponse
    case parsing(Error)
    case response(APIErrorResponse)
    
    static func == (lhs: APIClientError, rhs: APIClientError) -> Bool {
        switch (lhs, rhs) {
        case (.decoding, .decoding):
            return true
        case (.encoding, .encoding):
            return true
        case (.parsing(let lhsError), .parsing(let rhsError)):
            return lhsError.localizedDescription == rhsError.localizedDescription
        case (.unknownResponse, .unknownResponse):
            return true
        case (.response(let lhsError), .response(let rhsError)):
            return lhsError.message == rhsError.message && lhsError.errors == rhsError.errors
        default:
            return false
        }
    }
}
