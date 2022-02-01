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

enum StaticsticAbbreviation: String, Codable {
    case a = "A"
    case d = "D"
    case f = "F"
    case gd = "GD"
    case gp = "GP"
    case l = "L"
    case p = "P"
    case pd = "PD"
    case ppg = "PPG"
    case r = "R"
    case rc = "RC"
    case total = "Total"
    case w = "W"
}

enum StatisticDescription: String, Codable {
    case draws = "Draws"
    case gamesPlayed = "Games Played"
    case goalDifference = "Goal Difference"
    case goalsAgainst = "Goals Against"
    case goalsFor = "Goals For"
    case losses = "Losses"
    case overall = "Overall"
    case overallRecord = "Overall Record"
    case pointDeductions = "Point Deductions"
    case points = "Points"
    case pointsPerGame = "Points Per Game"
    case rank = "Rank"
    case rankChange = "Rank Change"
    case wins = "Wins"
}

enum Name: String, Codable {
    case allSplits = "All Splits"
    case deductions = "deductions"
    case gamesPlayed = "gamesPlayed"
    case losses = "losses"
    case pointDifferential = "pointDifferential"
    case points = "points"
    case pointsAgainst = "pointsAgainst"
    case pointsFor = "pointsFor"
    case ppg = "ppg"
    case rank = "rank"
    case rankChange = "rankChange"
    case ties = "ties"
    case wins = "wins"
}

enum ShortDisplayName: String, Codable {
    case a = "A"
    case d = "D"
    case deductions = "Deductions"
    case f = "F"
    case gd = "GD"
    case gp = "GP"
    case l = "L"
    case over = "OVER"
    case p = "P"
    case ppg = "PPG"
    case rank = "Rank"
    case rankChange = "Rank Change"
    case w = "W"
}

