//
//  UICollectionView+RegisterNib.swift
//  football-standings
//
//  Created by Rowan Rhodes on 01/02/2022.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func register<T: UICollectionViewCell>(_: T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.defaultReuseIdentififer)
    }
    
    func register<T: UICollectionViewCell>(_: T.Type) where T: NibLoadedView {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        register(nib, forCellWithReuseIdentifier: T.defaultReuseIdentififer)
    }
    
    func dequeReuseIdentifier<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.defaultReuseIdentififer, for: indexPath) as? T else {
            fatalError("Could not deque cell with identifier \(T.defaultReuseIdentififer)")
        }
        
        return cell
    }
}
