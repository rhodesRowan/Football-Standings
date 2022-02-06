//
//  StandingsCell.swift
//  football-standings
//
//  Created by Rowan Rhodes on 31/01/2022.
//

import Foundation
import UIKit

final class StandingsCell : BaseCollectionViewCell {
    
    // MARK: IBOutlets
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var avatarImageView: CircularAvatar!
    @IBOutlet weak var winsStatStack : StatStackView!
    @IBOutlet weak var lossesStatStack: StatStackView!
    @IBOutlet weak var drawsStatStack: StatStackView!
    @IBOutlet weak var pointsStatStack: StatStackView!
    
    // MARK: Properties
    var viewModel: StandingTableViewCellViewModel!
    
    // MARK: Methods
    func bindViewWith(viewModel: StandingTableViewCellViewModel) {
        self.viewModel = viewModel
        self.teamNameLabel.text = self.viewModel.standing.team.shortDisplayName
        self.winsStatStack.bindStatistic(statistic: self.viewModel.GetStatistic(name: Name.wins)!)
        self.lossesStatStack.bindStatistic(statistic: self.viewModel.GetStatistic(name: Name.losses)!)
        self.drawsStatStack.bindStatistic(statistic: self.viewModel.GetStatistic(name: Name.ties)!)
        self.pointsStatStack.bindStatistic(statistic: self.viewModel.GetStatistic(name: Name.points)!)
        self.backgroundColor = self.viewModel.GetNoteColour()
        if let imageUrl = self.viewModel.GetLogoUrl() {
            ImageClient.shared.setImage(from: imageUrl, placeholderImage: nil) { [weak self] image in
                guard let self = self else {
                    return
                }
                
                self.avatarImageView.image = image
            }
        }
    }
    
    // MARK: BaseCollectionViewCell
    override func configureCell() {
        self.clipsToBounds = false
        self.layer.cornerRadius = 10
    }
}
