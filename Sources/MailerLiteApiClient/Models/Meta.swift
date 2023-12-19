//
//  Meta.swift
//
//
//  Created by Michael Watts on 12/18/23.
//

import Foundation

public struct Meta: Decodable {
    public let path: String?
    public let perPage: Int?
    public let nextCursor: String?
    public let prevCursor: String?
    
    enum CodingKeys: String, CodingKey {
        case path
        case perPage = "per_page"
        case nextCursor = "next_cursor"
        case prevCursor = "prev_cursor"
    }
}
