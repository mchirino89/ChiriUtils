//
//  FileHelperTest.swift
//  ChiriUtilsTests
//
//  Created by Mauricio Chirino on 18/04/2019.
//  Copyright © 2019 Mauricio Chirino. All rights reserved.
//

import XCTest
@testable import ChiriUtils

class FileHelperTest: XCTestCase {

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
        guard let json = try? JSONEncoder().encode(TestUser()) else {
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
        let localFile = FileHelper.read(in: Bundle(for: type(of: self)), from: "validJSON")
        XCTAssertNotNil(localFile)
    }

    func testNonExistingFileFromBundle() {
        let localFile = FileHelper.read(in: Bundle(for: type(of: self)), from: "", and: .text)
        XCTAssertNil(localFile)
    }

    func testReadLocalFile() {
        let path = folderPath + fileName
        XCTAssertNotNil(FileHelper.readAt(url: path))
    }

    func testFailingReadingOfLocalFile() {
        XCTAssertNil(FileHelper.readAt(url: ""), "Returning nil if file isn't found")
    }

}
