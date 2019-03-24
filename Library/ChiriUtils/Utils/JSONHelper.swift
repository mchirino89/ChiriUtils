//
//  JSONHelper.swift
//  ChiriUtils
//
//  Created by Mauricio Chirino on 24/03/2019.
//  Copyright © 2019 Mauricio Chirino. All rights reserved.
//

import Foundation

struct JSONHelper {
    static func read(from filename: String) -> Data? {
        do {
            guard let file = Bundle.main.url(forResource: filename, withExtension: "json") else {
                print("No json file found for \(filename)")
                return nil
            }
            return try Data(contentsOf: file)
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }

    static func readAt(url: String) -> Data? {
        let fileName = url + ".json"

        do {
            if !FileManager.default.fileExists(atPath: fileName) {
                NSLog("File doesn't exist: \(fileName)")
                return nil
            }
            return try Data(contentsOf: URL(fileURLWithPath: fileName))
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
