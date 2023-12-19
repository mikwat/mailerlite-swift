//
//  File.swift
//  
//
//  Created by Michael Watts on 12/18/23.
//

import Foundation

enum APIClientError: Error {
    case decoding, encoding, parsing, unknownResponse
}
