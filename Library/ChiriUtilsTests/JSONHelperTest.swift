//
//  JSONHelperTest.swift
//  ChiriUtilsTests
//
//  Created by Mauricio Chirino on 18/04/2019.
//  Copyright © 2019 Mauricio Chirino. All rights reserved.
//

import XCTest
@testable import ChiriUtils

struct User: Codable {
    let name: String
    let age: Int
    let birthday: Int

    init() {
        name = "Mauricio Chirino"
        age = 29
        birthday = 620319600
    }
}

class JSONHelperTest: XCTestCase {

    let fileName = "Temporal.json"
    let folderPath = NSTemporaryDirectory()

    override func setUp() {
        super.setUp()
        createTestingFile()
    }

    override func tearDown() {
        super.tearDown()
        try? FileManager.default.removeItem(atPath: folderPath)
    }

    private func createTestingFile() {
        try? FileManager.default.createDirectory(atPath: folderPath,
                                                 withIntermediateDirectories: true,
                                                 attributes: nil)
        let filePath = folderPath.appending(fileName)
        guard let json = try? JSONEncoder().encode(User()) else {
            XCTFail("Something went wrong when encoding test User structure")
            return
        }
        do {
            try json.write(to: URL(fileURLWithPath: filePath))
        } catch {
            NSLog("Failed to write JSON data: \(error.localizedDescription)")
        }
    }

    func testJSONReadingFromBundle() {
        let localFile = JSONHelper.read(in: Bundle(for: type(of: self)), from: "testJSON")
        XCTAssertNotNil(localFile)
    }

    func testFailingReadinfFromBundle() {
        XCTAssertNil(JSONHelper.read(from: ""), "Returning nil in case of wrong path/bundle")
    }

    func testReadLocalFile() {
        let path = folderPath + fileName
        XCTAssertNotNil(JSONHelper.readAt(url: path))
    }

    func testReadLocalFileWithoutJSONExtension() {
        let path = folderPath + fileName.split(separator: ".").first!
        XCTAssertNotNil(JSONHelper.readAt(url: path))
    }

    func testFailingReadingOfLocalFile() {
        XCTAssertNil(JSONHelper.readAt(url: ""), "Returning nil if file isn't found")
    }

}
