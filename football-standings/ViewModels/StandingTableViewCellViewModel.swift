//
//  StandingTableViewCellViewModel.swift
//  football-standings
//
//  Created by Rowan Rhodes on 30/01/2022.
//

import Foundation

struct StandingTableViewCellViewModel {
    let standing: Standing
    
    func GetStatistic(name: Name) -> Statistic? {
        return standing.stats.first {
            $0.name == name
        }
    }
}
