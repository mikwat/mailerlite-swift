//
//  UpsertSubscriber.swift
//
//
//  Created by Michael Watts on 12/18/23.
//

import Foundation

public struct UpsertSubscriber: APIRequest {
    public typealias Response = UpsertSubscriberResponse
    
    public var resourceName: String { "subscribers" }
    public var method: APIMethod { .post }
    
    public let email: String?
    public let fields: Subscriber.Fields?
    public let groups: [String]?
    public let status: String?
    public let subscribedAt: String?
    public let ipAddress: String?
    public let optedInAt: String?
    public let optinIp: String?
    public let unsubscribedAt: String?
    
    init(
        email: String? = nil,
        fields: Subscriber.Fields? = nil,
        groups: [String]? = nil,
        status: String? = nil,
        subscribedAt: String? = nil,
        ipAddress: String? = nil,
        optedInAt: String? = nil,
        optinIp: String? = nil,
        unsubscribedAt: String? = nil
    ) {
        self.email = email
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
        case email
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

public struct UpsertSubscriberResponse: Decodable {
    public let data: Subscriber?
}
