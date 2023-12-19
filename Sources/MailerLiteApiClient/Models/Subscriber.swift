//
//  Subscriber.swift
//
//
//  Created by Michael Watts on 12/16/23.
//

import Foundation

public struct Subscriber: Codable {
    public let id: String
    public let email: String?
    public let status: String?
    public let source: String?
    public let sent: Int?
    public let opensCount: Int?
    public let clicksCount: Int?
    public let openRate: Double?
    public let clickRate: Double?
    public let ipAddresses: String?
    public let subscribedAt: String?
    public let unsubscribedAt: String?
    public let createdAt: String?
    public let updatedAt: String?
    public let fields: Fields?
    public let groups: [Group]?
    public let optedInAt: String?
    public let optinIp: String?
    
    public struct Fields: Codable {
        public let city: String?
        public let company: String?
        public let country: String?
        public let lastName: String?
        public let name: String?
        public let phone: String?
        public let state: String?
        public let zip: String?
        
        init(
            city: String? = nil,
            company: String? = nil,
            country: String? = nil,
            lastName: String? = nil,
            name: String? = nil,
            phone: String? = nil,
            state: String? = nil,
            zip: String? = nil
        ) {
            self.city = city
            self.company = company
            self.country = country
            self.lastName = lastName
            self.name = name
            self.phone = phone
            self.state = state
            self.zip = zip
        }
        
        enum CodingKeys: String, CodingKey {
            case city
            case company
            case country
            case lastName = "last_name"
            case name
            case phone
            case state
            case zip = "z_i_p"
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case status
        case source
        case sent
        case opensCount = "opens_count"
        case clicksCount = "clicks_count"
        case openRate = "open_rate"
        case clickRate = "click_rate"
        case ipAddresses = "ip_addresses"
        case subscribedAt = "subscribed_at"
        case unsubscribedAt = "unsubscribed_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case fields
        case groups
        case optedInAt = "opted_in_at"
        case optinIp = "optin_ip"
    }
}
