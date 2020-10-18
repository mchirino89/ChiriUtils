//
//  Sequence.swift
//  ChiriUtils
//
//  Created by Mauricio Chirino on 1/4/20.
//  Copyright © 2020 Mauricio Chirino. All rights reserved.
//

import Foundation

public extension Sequence {
    /// Counts the number of occurrences determined by the predicate
    /// - Parameter predicate: match closure to match occurrences with each element within the array
    /// - Returns: number of occurrences found for the given predicate
    func count(where predicate: (Element) -> Bool) -> Int {
        var count = 0
        for item in self {
            if predicate(item) {
                count += 1
            }
        }
        return count
    }
}

public extension Sequence where Element: Numeric {
    /// Provides the sum of all elements in the collection
    var sum: Element {
        self.reduce(0, +)
    }
}

public extension Sequence where Element: Equatable {
    /// Counts the number of occurrences of a given element within the array
    /// - Parameter inputTarget: element to count inside the array
    /// - Returns: number of times it appeared
    func numberOfOccurrences(of inputTarget: Element) -> Int {
        return reduce(0) { result, element in
            guard element == inputTarget else {
                return result
            }

            return result + 1
        }
    }
}
