//
//  RandomGenerator.swift
//  ChiriUtils
//
//  Created by Mauricio Chirino on 18/10/20.
//  Copyright © 2020 Mauricio Chirino. All rights reserved.
//

public extension Array where Element == Int {
    static func generateRandomElements(arraySize: Int) -> [Int] {
        guard arraySize > 0 else {
            return [Int]()
        }

        var result = Array(repeating: 0, count: arraySize)

        for index in 0..<arraySize {
            result[index] = Int.random(in: 0..<arraySize)
        }

        return result
    }
}
