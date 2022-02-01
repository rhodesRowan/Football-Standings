//
//  StandingsViewModel.swift
//  football-standings
//
//  Created by Rowan Rhodes on 30/01/2022.
//

import Foundation

protocol StandingsViewModelInterface {
    var standingViewModels: [StandingTableViewCellViewModel] { get set }
    var onFetchStandingsSucceed: (() -> Void)? { get set }
    var onFetchStandingsError: ((Error) -> Void)? { get set }
    func fetchStandings()
}

final class StandingsViewModel : StandingsViewModelInterface {
    
    var onFetchStandingsSucceed: (() -> Void)?
    var onFetchStandingsError: ((Error) -> Void)?
    var standingViewModels: [StandingTableViewCellViewModel] = []
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func fetchStandings() {
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
