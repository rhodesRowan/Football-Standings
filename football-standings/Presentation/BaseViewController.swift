//
//  ViewController.swift
//  football-standings
//
//  Created by Rowan Rhodes on 01/02/2022.
//

import Foundation
import UIKit

protocol ViewControllerInterface where Self: UIViewController {
    
    func showLoading()
    func stopLoading()
}

class BaseViewController : UIViewController, ViewControllerInterface {
    
    private var spinner: UIActivityIndicatorView?
    
    func showLoading() {
        guard let spinner = self.spinner else { return }
        spinner.startAnimating()
    }
    
    func stopLoading() {
        guard let spinner = self.spinner else { return }
        spinner.stopAnimating()
    }
        
    override func viewDidLoad() {
        self.configureView()
    }

    func configureView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.spinner = UIActivityIndicatorView(style: .large)
            self.spinner?.hidesWhenStopped = true
            self.spinner?.center = self.view.center
            self.spinner?.style = UIActivityIndicatorView.Style.medium
            self.view.addSubview(self.spinner!)
            self.spinner?.startAnimating()
        }
    }
}
