//
//  SequenceTestCase.swift
//  ChiriUtilsTests
//
//  Created by Mauricio Chirino on 1/4/20.
//  Copyright © 2020 Mauricio Chirino. All rights reserved.
//

import XCTest
@testable import ChiriUtils

final class SequenceTestCase: XCTestCase {
    var randomArray: [Int]!

    override func setUp() {
        super.setUp()
        // Given
        randomArray = [0,0,0,0,0,1,200,3,4,5,65,546,546,3]
    }

    override func tearDown() {
        super.tearDown()
        randomArray = nil
    }

    func testOccurrencesWithinASequence() {
        // When
        let zeroOccurrencesWithinArray = randomArray.numberOfOccurrences(of: 0)

        // Then
        XCTAssertEqual(zeroOccurrencesWithinArray, 5)
    }

    func testMatchesWithinASequence() {
        // When
        let largestDigitsOccurrences = randomArray.count(where: { $0 > 100 })

        // Then
        XCTAssertEqual(largestDigitsOccurrences, 3)
    }
}
