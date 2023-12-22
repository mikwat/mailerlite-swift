//
//  ListSubscribers.swift
//
//
//  Created by Michael Watts on 12/16/23.
//

import Foundation

public struct ListSubscribers: APIRequest {
    public typealias Response = ListSubscribersResponse
    
    public var resourceName: String { "subscribers" }
    public var method: APIMethod { .get }
    
    public let filter: String?
    public let limit: Int?
    public let cursor: String?
    
    public init(filter: String? = nil, limit: Int? = nil, cursor: String? = nil) {
        self.filter = filter
        self.limit = limit
        self.cursor = cursor
    }
}

public struct ListSubscribersResponse: Decodable {
    public let data: [Subscriber]?
    public let links: Links?
    public let meta: Meta?
}
