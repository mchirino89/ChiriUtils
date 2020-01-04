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
}

extension Sequence where Element: Numeric {
    var sum: Element {
        self.reduce(0, +)
    }
}
