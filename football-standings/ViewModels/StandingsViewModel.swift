//
//  StandingsViewModel.swift
//  football-standings
//
//  Created by Rowan Rhodes on 30/01/2022.
//

import Foundation

protocol BaseViewModel : AnyObject {
    
    var coordinator: Coordinator? { get }
}

protocol StandingsViewModelInterface : BaseViewModel {
    var standingViewModels: [StandingTableViewCellViewModel] { get set }
    var onFetchStandingsSucceed: (() -> Void)? { get set }
    var onFetchStandingsError: ((Error) -> Void)? { get set }
    func fetchStandings()
}

final class StandingsViewModel : StandingsViewModelInterface {
    
    let title = "Standings"
    var coordinator: Coordinator?
    var onFetchStandings: (() -> Void)?
    var onFetchStandingsSucceed: (() -> Void)?
    var onFetchStandingsError: ((Error) -> Void)?
    var standingViewModels: [StandingTableViewCellViewModel] = []
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService, coordinator: Coordinator) {
        self.networkService = networkService
        self.coordinator = coordinator
    }
    
    func fetchStandings() {
        self.onFetchStandings?()
        let request = FootballStandingsRequest()
        networkService.request(request) { [weak self] result in
            guard let self = self else {
                return
            }
            
            switch result {
            case .success(let league):
                self.standingViewModels = league.standings.compactMap({
                    StandingTableViewCellViewModel(standing: $0)
                })
                self.onFetchStandingsSucceed?()
            case .failure(let error):
                self.onFetchStandingsError?(error)
            }
        }
    }
}
