//
//  Group.swift
//
//
//  Created by Michael Watts on 12/18/23.
//

import Foundation

public struct Group: Codable {
    public let id: String
    public let name: String?
    public let activeCount: Int?
    public let sentCount: Int?
    public let opensCount: Int?
    public let openRate: Rate?
    public let clicksCount: Int?
    public let clickRate: Rate?
    public let unsubscribedCount: Int?
    public let unconfirmedCount: Int?
    public let bouncedCount: Int?
    public let junkCount: Int?
    public let createdAt: String?
    
    public init(
        id: String,
        name: String? = nil,
        activeCount: Int? = nil,
        sentCount: Int? = nil,
        opensCount: Int? = nil,
        openRate: Rate? = nil,
        clicksCount: Int? = nil,
        clickRate: Rate? = nil,
        unsubscribedCount: Int? = nil,
        unconfirmedCount: Int? = nil,
        bouncedCount: Int? = nil,
        junkCount: Int? = nil,
        createdAt: String? = nil
    ) {
        self.id = id
        self.name = name
        self.activeCount = activeCount
        self.sentCount = sentCount
        self.opensCount = opensCount
        self.openRate = openRate
        self.clicksCount = clicksCount
        self.clickRate = clickRate
        self.unsubscribedCount = unsubscribedCount
        self.unconfirmedCount = unconfirmedCount
        self.bouncedCount = bouncedCount
        self.junkCount = junkCount
        self.createdAt = createdAt
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case activeCount = "active_count"
        case sentCount = "sent_count"
        case opensCount = "opens_count"
        case openRate = "open_rate"
        case clicksCount = "clicks_count"
        case clickRate = "click_rate"
        case unsubscribedCount = "unsubscribed_count"
        case unconfirmedCount = "unconfirmed_count"
        case bouncedCount = "bounced_count"
        case junkCount = "junk_count"
        case createdAt = "created_at"
    }
}
