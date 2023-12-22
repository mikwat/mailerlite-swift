//
//  Other.swift
//  
//
//  Created by Michael Watts on 12/18/23.
//

import Foundation

public struct Rate: Codable {
    public let float64: Double?
    public let string: String?
    
    init(float64: Double? = nil, string: String? = nil) {
        self.float64 = float64
        self.string = string
    }
    
    enum CodingKeys: String, CodingKey {
        case float64, string
    }
}
