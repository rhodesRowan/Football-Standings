//
//  BaseCollectionViewCell.swift
//  football-standings
//
//  Created by Rowan Rhodes on 04/02/2022.
//

import Foundation
import UIKit

class BaseCollectionViewCell : UICollectionViewCell, NibLoadedView {
    
    override func awakeFromNib() {
        self.configureCell()
    }
    
    func configureCell() {
        
    }
}
