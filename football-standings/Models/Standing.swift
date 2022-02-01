//
//  Standing.swift
//  football-standings
//
//  Created by Rowan Rhodes on 30/01/2022.
//

import Foundation

struct Standing: Codable {
    let team: Team
    let note: Note?
    let stats: [Statistic]
}
