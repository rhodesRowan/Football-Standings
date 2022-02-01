//
//  StandingsCell.swift
//  football-standings
//
//  Created by Rowan Rhodes on 31/01/2022.
//

import Foundation
import UIKit

final class StandingsCell : UITableViewCell {
    
    static let cellIdentifier = "standingsCellIdentifier"
    
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamRankingLabel: UILabel!
    
    
    func bindViewWith(viewModel: StandingTableViewCellViewModel) {
        teamNameLabel.text = viewModel.standing.team.name
        teamRankingLabel.text = viewModel.GetStatistic(name: Name.rank)?.displayValue ?? "N/A"
    }
}
