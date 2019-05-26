//
//  Extensions.swift
//  ChiriUtils
//
//  Created by Mauricio Chirino on 24/03/2019.
//  Copyright © 2019 Mauricio Chirino. All rights reserved.
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

public extension UITableView {

    func register(cellType: AnyClass) {
        self.register(cellType.self, forCellReuseIdentifier: String(describing: cellType.self))
    }

    func deque<T: UITableViewCell>(for id: String = String(describing: T.self)) -> T {
        guard let dequeued = self.dequeueReusableCell(withIdentifier: id) as? T else {
            preconditionFailure("Check your UITableViewCell settings for \(T.self)")
        }
        return dequeued
    }
}
