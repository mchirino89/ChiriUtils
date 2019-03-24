//
//  Extensions.swift
//  ChiriUtils
//
//  Created by Mauricio Chirino on 24/03/2019.
//  Copyright © 2019 Mauricio Chirino. All rights reserved.
//

extension UITableView {

    func deque<T: UITableViewCell>(for id: String = String(describing: T.self)) -> T {
        guard let dequeued = self.dequeueReusableCell(withIdentifier: id) as? T else {
            preconditionFailure("Check your UITableViewCell settings for \(T.self)")
        }
        return dequeued
    }

    // Check this for futher details https://www.swiftbysundell.com/posts/enum-iterations-in-swift-42
    func registerCellClasses<T: CaseIterable & RawRepresentable>(for sectionType: T.Type,
                                                                 using resolver: (T) -> UITableViewCell.Type) where T.RawValue == String {
        for section in sectionType.allCases {
            register(resolver(section), forCellReuseIdentifier: section.rawValue)
        }
    }
}
