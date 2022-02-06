//
//  StatStackView.swift
//  football-standings
//
//  Created by Rowan Rhodes on 05/02/2022.
//

import Foundation
import UIKit

class StatStackView : UIStackView {
    
    var descriptionLabel : UILabel = {
        var label = UILabel()
        label.textColor = UIColor.secondaryLabel
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var statLabel : UILabel = {
        var label = UILabel()
        label.textColor = UIColor.label
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var statistic : Statistic!
    
    override func awakeFromNib() {
        configureView()
    }
    
    func bindStatistic(statistic: Statistic) {
        self.descriptionLabel.text = statistic.shortDisplayName.rawValue
        self.statLabel.text = statistic.displayValue
    }
    
    func configureView() {
        self.axis = .vertical
        self.backgroundColor = .clear
        
        self.distribution = .fillProportionally
        self.addArrangedSubview(statLabel)
        self.addArrangedSubview(descriptionLabel)
    }
}
