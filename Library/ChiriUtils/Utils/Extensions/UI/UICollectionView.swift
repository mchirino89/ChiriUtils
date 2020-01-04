//
//  UICollectionView.swift
//  ChiriUtils
//
//  Created by Mauricio Chirino on 1/4/20.
//  Copyright © 2020 Mauricio Chirino. All rights reserved.
//

import UIKit

public extension UICollectionView {
    func register(cellType: AnyClass) {
        self.register(cellType.self, forCellWithReuseIdentifier: String(describing: cellType.self))
    }

    func deque<T: UICollectionViewCell>(for id: String = String(describing: T.self),
                                        at indexPath: IndexPath) -> T {
        guard let dequeued = self.dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as? T else {
            preconditionFailure("Check your UICollectionViewCell settings for \(T.self)")
        }
        return dequeued
    }
}
