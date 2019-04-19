//
//  Decoder.swift
//  ChiriUtils
//
//  Created by Mauricio Chirino on 24/03/2019.
//  Copyright © 2019 Mauricio Chirino. All rights reserved.
//

import Foundation

enum JSONDecodableError: Error {
    case missingKey
    case wrongFormat
}

// This could also be a protocol
public struct JSONDecodable {
    public static func map<T: Decodable>(basedOn input: Data,
                                  with strategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) -> T {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = strategy
        do {
            let decodedData = try decoder.decode(T.self, from: input)
            return decodedData
        } catch let error {
            preconditionFailure("Impossible to decode received input to type \(T.self): \(error.localizedDescription)")
        }
    }
}

