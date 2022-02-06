//
//  NibReusable.swift
//  football-standings
//
//  Created by Rowan Rhodes on 01/02/2022.
//

import Foundation
import UIKit

protocol ReusableView: AnyObject {
    static var defaultReuseIdentififer: String { get }
}

extension ReusableView where Self : UIView {
    static var defaultReuseIdentififer: String {
        return NSStringFromClass(self)
    }
}
