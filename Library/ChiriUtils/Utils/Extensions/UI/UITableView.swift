//
//  UITableView.swift
//  ChiriUtils
//
//  Created by Mauricio Chirino on 24/03/2019.
//  Copyright © 2019 Mauricio Chirino. All rights reserved.
//

import UIKit

public extension UITableView {
    func register(cellType: AnyClass) {
        self.register(cellType.self, forCellReuseIdentifier: String(describing: cellType.self))
    }

    func dequeue<T: UITableViewCell>(for id: String = String(describing: T.self)) -> T {
        guard let dequeued = self.dequeueReusableCell(withIdentifier: id) as? T else {
            preconditionFailure("Check your UITableViewCell settings for \(T.self)")
        }
        return dequeued
    }
}
