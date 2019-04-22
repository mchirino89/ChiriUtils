//
//  FileHelper.swift
//  ChiriUtils
//
//  Created by Mauricio Chirino on 24/03/2019.
//  Copyright © 2019 Mauricio Chirino. All rights reserved.
//

import Foundation

public enum FileExtension: String {
    case text = "txt"
    case json

    var value: String {
        return self.rawValue
    }
}

public struct FileHelper {
    // Check why it finds a JSON file is filename parameter is left empty
    public static func read(in bundle: Bundle = .main,
                     from filename: String, and type: FileExtension = .json) -> Data? {
        guard let file = bundle.url(forResource: filename, withExtension: type.value) else {
            NSLog("No file found for \(filename).\(type.value)")
            return nil
        }
        return try! Data(contentsOf: file)
    }

    public static func readAt(url: String) -> Data? {
        if !FileManager.default.fileExists(atPath: url) {
            NSLog("File doesn't exist: \(url)")
            return nil
        }
        return try! Data(contentsOf: URL(fileURLWithPath: url))
    }
}
