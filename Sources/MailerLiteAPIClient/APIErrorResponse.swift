//
//  APIErrorResponse.swift
//  
//
//  Created by Michael Watts on 12/18/23.
//

import Foundation

public struct APIErrorResponse: Decodable, Sendable {
    let message: String?
    let errors: [String: [String]]?
}
