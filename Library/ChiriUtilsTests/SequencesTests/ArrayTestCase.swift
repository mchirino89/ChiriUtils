//
//  ArrayTestCase.swift
//  ChiriUtilsTests
//
//  Created by Mauricio Chirino on 1/4/20.
//  Copyright © 2020 Mauricio Chirino. All rights reserved.
//

import XCTest
@testable import ChiriUtils

final class ArrayTestCase: XCTestCase {
    func testAverage() {
        // Given
        let dummyArray: [Float] = [1, 2, 3, 4, 5]
        // When
        let average = dummyArray.average
        // Then
        XCTAssertEqual(average, 3)
    }

    func testRandomGenerator() {
        // Given
        let randomElementCount = 20
        var numberOfCoincidentElements = 0

        // When
        let random1 = Array.generateRandomElements(arraySize: randomElementCount)
        let random2 = Array.generateRandomElements(arraySize: randomElementCount)

        // Then
        (0..<randomElementCount).forEach { index in
            if random1[index] == random2[index] {
                numberOfCoincidentElements += 1
            }
        }

        XCTAssertNotEqual(numberOfCoincidentElements, randomElementCount, "Elements generated are not random")
    }

    func testSafeGuardAgainstInvalidSizeForRandomGenerator() {
        // Given
        let randomElementCount = -2

        // When
        let randomElements = Array.generateRandomElements(arraySize: randomElementCount)

        // Then
        XCTAssert(randomElements.isEmpty, "Generated empty array when provided < 0 size")
    }
}
