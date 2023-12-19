//
//  File.swift
//  
//
//  Created by Michael Watts on 12/16/23.
//

import Foundation

public protocol APIRequest: Encodable {
    associatedtype Response: Decodable
    
    var resourceName: String { get }
    var method: APIMethod { get }
}

public enum APIMethod: String {
    case get, post, put, delete
}
