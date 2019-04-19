//
//  DecoderTests.swift
//  ChiriUtilsTests
//
//  Created by Mauricio Chirino on 24/03/2019.
//  Copyright © 2019 Mauricio Chirino. All rights reserved.
//

import XCTest
@testable import ChiriUtils

class DecoderTests: XCTestCase {

    func testDecoding() {
        var userRawData: Data {
            return Data("""
                {
                    "name": "Mauricio Chirino",
                    "age": 29,
                    "birthday": 620319600
                }
            """.utf8)
        }
        let userDecoded: TestUser = try! JSONDecodable.map(input: userRawData)
        let temporalUser = TestUser()
        XCTAssert(userDecoded == temporalUser)
    }

    func testMissingKey() {
        var userRawData: Data {
            return Data("""
                {
                    "name": "Mauricio Chirino",
                    "age": 29,
                    "": 620319600
                }
            """.utf8)
        }
        do {
            let _: TestUser = try JSONDecodable.map(input: userRawData)
        } catch let error as JSONDecodableError {
            switch error {
            case .missingKey(_):
                XCTAssert(true)
                return
            default:
                XCTAssert(false)
            }
        } catch { }
        XCTAssert(false)
    }

    func testMissingValue() {
        var userRawData: Data {
            return Data("""
                {
                    "name": "Mauricio Chirino",
                    "age": 29,
                    "birthday": null
                }
            """.utf8)
        }
        do {
            let _: TestUser = try JSONDecodable.map(input: userRawData)
        } catch let error as JSONDecodableError {
            switch error {
            case .missingValue(_):
                XCTAssert(true)
                return
            default:
                XCTAssert(false)
            }
        } catch { }
        XCTAssert(false)
    }

    func testDataWrongFormat() {
        var userRawData: Data {
            return Data("""
                {
                    "name": "Mauricio Chirino",
                    "age": 29,
                    "birthday": "28/08/1989"
                }
            """.utf8)
        }
        do {
            let _: TestUser = try JSONDecodable.map(input: userRawData)
        } catch let error as JSONDecodableError {
            switch error {
            case .wrongFormat(_):
                XCTAssert(true)
                return
            default:
                XCTAssert(false)
            }
        } catch { }
        XCTAssert(false)
    }

    func testCorruptedData() {
        var userRawData: Data {
            return Data("""
                {
                    "name": "Mauricio Chirino",
                    "age": 29,
                    birthday: 28/08/1989
                }
            """.utf8)
        }
        do {
            let _: TestUser = try JSONDecodable.map(input: userRawData)
        } catch let error as JSONDecodableError {
            switch error {
            case .dataCorrupted(_):
                XCTAssert(true)
                return
            default:
                XCTAssert(false)
            }
        } catch { }
        XCTAssert(false)
    }

}
