//
//  NibLoadedView.swift
//  football-standings
//
//  Created by Rowan Rhodes on 01/02/2022.
//

import Foundation
import UIKit

protocol NibLoadedView: AnyObject {
    static var nibName: String { get }
}

extension NibLoadedView where Self: UIView {
    
    static var nibName: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
