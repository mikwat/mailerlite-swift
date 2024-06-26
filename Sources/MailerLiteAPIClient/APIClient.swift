//
//  APIClient.swift
//  
//
//  Created by Michael Watts on 12/18/23.
//

import Foundation

public typealias ResultCallback<Value> = (Result<Value, Error>) -> Void

protocol APIClient {
    func send<T: APIRequest>(_ request: T) async throws -> T.Response
}
