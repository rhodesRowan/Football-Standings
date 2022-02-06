//
//  AppCoordinator.swift
//  football-standings
//
//  Created by Rowan Rhodes on 02/02/2022.
//

import Foundation
import UIKit

final class AppCoordinator : Coordinator {
        
    private(set) var childCoordinators: [Coordinator] = []
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        let standingsListCoordinator = StandingsListCoordinator(with: navigationController)
        standingsListCoordinator.start()
        self.childCoordinators.append(standingsListCoordinator)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
