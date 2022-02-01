//
//  Response.swift
//  football-standings
//
//  Created by Rowan Rhodes on 30/01/2022.
//

import Foundation

struct ApiResponse: Codable {
    let status: Bool
    let league: League
    
    enum CodingKeys: String, CodingKey {
        case status
        case league = "data"
    }
}
