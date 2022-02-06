//
//  UIViewController+LoadFromNib.swift
//  football-standings
//
//  Created by Rowan Rhodes on 01/02/2022.
//

import Foundation
import UIKit

extension UIViewController : NibLoadedView {
    
    class func loadController() -> Self {
        return Self(nibName: Self.nibName, bundle: nil)
    }
}
