//
//  StandingTableViewCellViewModel.swift
//  football-standings
//
//  Created by Rowan Rhodes on 30/01/2022.
//

import Foundation
import UIKit

struct StandingTableViewCellViewModel {
    let standing: Standing
    
    func GetStatistic(name: Name) -> Statistic? {
        return standing.stats.first {
            $0.name == name
        }
    }
    
    func GetLogoUrl() -> String? {
        return standing.team.logos.first?.href
    }
    
    func GetNoteColour() -> UIColor {
        if let noteColor = standing.note?.color {
            return UIColor(hexString: noteColor)
        }
        
        return UIColor.secondarySystemBackground
    }
}
