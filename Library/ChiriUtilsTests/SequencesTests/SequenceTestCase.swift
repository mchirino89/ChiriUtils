//
//  SequenceTestCase.swift
//  ChiriUtilsTests
//
//  Created by Mauricio Chirino on 1/4/20.
//  Copyright © 2020 Mauricio Chirino. All rights reserved.
//

import XCTest
@testable import ChiriUtils

struct PairGenerator: Sequence, IteratorProtocol, Equatable {
    var current = 1

    mutating func next() -> Int? {
        defer {
            current += 1
        }

        return current
    }

    static func == (lhs: PairGenerator, rhs: PairGenerator) -> Bool {
        lhs.current == rhs.current
    }
}

class SequenceTestCase: XCTestCase {
    func testPairs() {
        // Given
        let dummyArray = PairGenerator()
        var i = 0
        // When
        let pairs = dummyArray.eachPair
        let stubPairs = [(1,2), (2,3), (3,4)]
        // Then
        for container in pairs.enumerated() {
            XCTAssertEqual(container.element.0, stubPairs[container.offset].0)
            XCTAssertEqual(container.element.1, stubPairs[container.offset].1)
            i += 1
            if i == 3 { break }
        }
    }
}
