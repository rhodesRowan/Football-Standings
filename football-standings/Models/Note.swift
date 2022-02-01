//
//  Note.swift
//  football-standings
//
//  Created by Rowan Rhodes on 30/01/2022.
//

import Foundation

struct Note: Codable {
    let color, noteDescription: String
    let rank: Int

    enum CodingKeys: String, CodingKey {
        case color
        case noteDescription = "description"
        case rank
    }
}
