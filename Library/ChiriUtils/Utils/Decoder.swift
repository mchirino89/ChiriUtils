//
//  Decoder.swift
//  ChiriUtils
//
//  Created by Mauricio Chirino on 24/03/2019.
//  Copyright © 2019 Mauricio Chirino. All rights reserved.
//

import Foundation

public enum JSONDecodableError: Error {
    case missingKey(CodingKey)
    case missingValue(Any.Type)
    case wrongFormat(Any.Type)
    case dataCorrupted(DecodingError.Context)
}

// This could also be a protocol
public struct JSONDecodable {
    public static func map<T: Decodable>(input: Data,
                                         with strategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) throws -> T {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = strategy
        do {
            return try decoder.decode(T.self, from: input)
        } catch DecodingError.keyNotFound(let missingkey, _) {
            NSLog("Missing key: \(missingkey.stringValue).")
            throw JSONDecodableError.missingKey(missingkey)
        } catch DecodingError.valueNotFound(let missingValue, let context) {
            NSLog("Missing value for: \(missingValue). \(context.debugDescription)")
            throw JSONDecodableError.missingValue(missingValue)
        } catch DecodingError.typeMismatch(let missMatch, let context) {
            NSLog("Wrong type for: \(missMatch). \(context.debugDescription)")
            throw JSONDecodableError.wrongFormat(missMatch)
        } catch DecodingError.dataCorrupted(let context) {
            NSLog("Data is corruputed. \(context.debugDescription).")
            throw JSONDecodableError.dataCorrupted(context)
        }
    }
}

