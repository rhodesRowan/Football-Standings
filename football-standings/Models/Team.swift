//
//  Team.swift
//  football-standings
//
//  Created by Rowan Rhodes on 30/01/2022.
//

import Foundation

struct Team: Codable {
    let id, uid, location, name: String
    let abbreviation, displayName, shortDisplayName: String
    let isActive: Bool
    let logos: [Logo]
}
