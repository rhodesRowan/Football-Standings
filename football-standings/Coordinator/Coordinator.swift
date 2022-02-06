//
//  Coordinator.swift
//  football-standings
//
//  Created by Rowan Rhodes on 02/02/2022.
//

import Foundation
import UIKit

protocol Coordinator {
    
    var childCoordinators: [Coordinator] { get }
    func start()
    
}
