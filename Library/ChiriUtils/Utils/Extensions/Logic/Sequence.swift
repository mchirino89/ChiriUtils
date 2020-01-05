//
//  Sequence.swift
//  ChiriUtils
//
//  Created by Mauricio Chirino on 1/4/20.
//  Copyright © 2020 Mauricio Chirino. All rights reserved.
//

import Foundation

extension Sequence {
    var eachPair: AnySequence<(Element, Element)> {
        AnySequence(zip(self, self.dropFirst()))
    }

    func count(where predicate: (Element) -> Bool) -> Int {
        var count = 0
        for item in self {
            if predicate(item) {
                count += 1
            }
        }
        return count
    }

    func sorted<T: Comparable>(on propertyAncestor: (Element) -> T) -> [Element] {
        self.sorted(by: { propertyAncestor($0) < propertyAncestor($1) })
    }
}

extension Sequence where Element: Numeric {
    var sum: Element {
        self.reduce(0, +)
    }
}

extension Sequence where Element: Equatable {
    func numberOfOccurrences(of target: Element) -> Int {
        return reduce(0) { result, element in
            guard element == target else {
                return result
            }

            return result + 1
        }
    }
}
