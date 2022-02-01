//
//  ViewController.swift
//  football-standings
//
//  Created by Rowan Rhodes on 30/01/2022.
//

import UIKit

class StandingsViewController: UIViewController {

    // MARK:- Private
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UINib.init(nibName: "StandingsCell", bundle: nil), forCellReuseIdentifier: StandingsCell.cellIdentifier)
        return table
    }()
    
    private var standingsViewModel = StandingsViewModel(networkService: NetworkService())
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        bindViewModelEvents()
        fetchStandings()
    }
    
    // MARK: Private
    
    private func configureViewController() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
    }
    
    private func fetchStandings() {
        standingsViewModel.fetchStandings()
    }
    
    private func bindViewModelEvents() {
        standingsViewModel.onFetchStandingsSucceed = { [weak self] in
            guard let self = self else {
                return
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        standingsViewModel.onFetchStandingsError = { error in
            print(error)
        }
    }
}

extension StandingsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return standingsViewModel.standingViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StandingsCell.cellIdentifier, for: indexPath) as? StandingsCell else {
            return UITableViewCell()
        }
        
        cell.bindViewWith(viewModel: standingsViewModel.standingViewModels[indexPath.row])
        return cell
    }
}

