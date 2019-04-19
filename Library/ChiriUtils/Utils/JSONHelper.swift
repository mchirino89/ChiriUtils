//
//  JSONHelper.swift
//  ChiriUtils
//
//  Created by Mauricio Chirino on 24/03/2019.
//  Copyright © 2019 Mauricio Chirino. All rights reserved.
//

import Foundation

public struct JSONHelper {
    static func read(in bundle: Bundle = .main, from filename: String) -> Data? {
        do {
            guard let file = bundle.url(forResource: filename, withExtension: "json") else {
                NSLog("No json file found for \(filename)")
                return nil
            }
            return try Data(contentsOf: file)
        } catch {
            NSLog(error.localizedDescription)
        }
        return nil
    }

    static func readAt(url: String) -> Data? {
        let urlExtension = ".json"
        let fileName = url.hasSuffix(urlExtension) ? url : url + urlExtension

        do {
            if !FileManager.default.fileExists(atPath: fileName) {
                NSLog("File doesn't exist: \(fileName)")
                return nil
            }
            return try Data(contentsOf: URL(fileURLWithPath: fileName))
        } catch {
            NSLog(error.localizedDescription)
            return nil
        }
    }
}
