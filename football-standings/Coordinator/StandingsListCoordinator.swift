//
//  StandingsListCoordinator.swift
//  football-standings
//
//  Created by Rowan Rhodes on 03/02/2022.
//

import Foundation
import UIKit

final class StandingsListCoordinator : Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = [Coordinator]()
    private let navigationController: UINavigationController!
    
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let networkService = NetworkService()
        let standingsViewModel = StandingsViewModel(networkService: networkService, coordinator: self)
        let standingsListViewController = StandingsListViewController.loadController()
        self.navigationController.setViewControllers([standingsListViewController], animated: false)
        standingsListViewController.standingsViewModel = standingsViewModel
    }
}
