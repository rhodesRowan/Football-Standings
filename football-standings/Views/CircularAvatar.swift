//
//  CircularAvatar.swift
//  football-standings
//
//  Created by Rowan Rhodes on 05/02/2022.
//

import Foundation
import UIKit

class CircularAvatar : UIImageView {
        
    override func awakeFromNib() {
        configureView()
    }
    
    func configureView() {
        self.clipsToBounds = false
        self.layer.cornerRadius = self.frame.width / 2
    }
}
