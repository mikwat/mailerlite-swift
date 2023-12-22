//
//  UpdateSubscriber.swift
//  
//
//  Created by Michael Watts on 12/21/23.
//

import Foundation

public struct UpdateSubscriber: APIRequest {
    public typealias Response = UpdateSubscriberResponse
    
    public var resourceName: String { "subscribers/\(id)" }
    public var method: APIMethod { .put }
    
    // Request path
    public let id: String
    
    // Request body
    public let fields: Subscriber.Fields?
    public let groups: [String]?
    public let status: String?
    public let subscribedAt: String?
    public let ipAddress: String?
    public let optedInAt: String?
    public let optinIp: String?
    public let unsubscribedAt: String?
    
    init(
        id: String,
        fields: Subscriber.Fields? = nil,
        groups: [String]? = nil,
        status: String? = nil,
        subscribedAt: String? = nil,
        ipAddress: String? = nil,
        optedInAt: String? = nil,
        optinIp: String? = nil,
        unsubscribedAt: String? = nil
    ) {
        self.id = id
        self.fields = fields
        self.groups = groups
        self.status = status
        self.subscribedAt = subscribedAt
        self.ipAddress = ipAddress
        self.optedInAt = optedInAt
        self.optinIp = optinIp
        self.unsubscribedAt = unsubscribedAt
    }
    
    enum CodingKeys: String, CodingKey {
        case fields
        case groups
        case status
        case subscribedAt = "subscribed_at"
        case ipAddress = "ip_address"
        case optedInAt = "opted_in_at"
        case optinIp = "optin_ip"
        case unsubscribedAt = "unsubscribed_at"
    }
}

public struct UpdateSubscriberResponse: Decodable {
    public let data: Subscriber?
}
