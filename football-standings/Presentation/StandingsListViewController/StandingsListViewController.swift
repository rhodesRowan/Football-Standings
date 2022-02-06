//
//  ViewController.swift
//  football-standings
//
//  Created by Rowan Rhodes on 30/01/2022.
//

import UIKit

class StandingsListViewController: BaseViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: Public
    var standingsViewModel: StandingsViewModel!
    
    
    // MARK: Lifecycle
    override func configureView() {
        super.configureView()
        self.title = standingsViewModel.title
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(StandingsCell.self)
        self.bindViewModelEvents()
        self.fetchStandings()
    }
    
    // MARK: Private Methods
    private func fetchStandings() {
        standingsViewModel.fetchStandings()
    }
    
    private func bindViewModelEvents() {
        
        standingsViewModel.onFetchStandings = { [weak self] in
            guard let self = self else {
                return
            }
            
            DispatchQueue.main.async {
                self.showLoading()
            }
        }
        
        standingsViewModel.onFetchStandingsSucceed = { [weak self] in
            guard let self = self else {
                return
            }
            
            DispatchQueue.main.async {
                self.stopLoading()
                self.collectionView.reloadData()
            }
        }
        
        standingsViewModel.onFetchStandingsError = { error in
            self.stopLoading()
        }
    }
}

extension StandingsListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return standingsViewModel.standingViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let viewModel = standingsViewModel.standingViewModels[indexPath.row]
        let cell: StandingsCell = collectionView.dequeReuseIdentifier(forIndexPath: indexPath)
        cell.bindViewWith(viewModel: viewModel)
        return cell
    }
}

extension StandingsListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 60)
    }
}

