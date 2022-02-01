//
//  Stat.swift
//  football-standings
//
//  Created by Rowan Rhodes on 30/01/2022.
//

import Foundation

struct Statistic: Codable {
    let name: Name
    let displayName: StatisticDescription
    let shortDisplayName: ShortDisplayName
    let statDescription: StatisticDescription
    let abbreviation: StaticsticAbbreviation
    let value: Int?
    let displayValue: String
    let id, summary: String?

    enum CodingKeys: String, CodingKey {
        case name, displayName, shortDisplayName
        case statDescription = "description"
        case abbreviation, value, displayValue, id, summary
    }
}
