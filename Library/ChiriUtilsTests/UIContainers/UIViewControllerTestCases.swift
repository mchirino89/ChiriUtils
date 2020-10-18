//
//  UIViewControllerTestCases.swift
//  ChiriUtilsTests
//
//  Created by Mauricio Chirino on 18/10/20.
//  Copyright © 2020 Mauricio Chirino. All rights reserved.
//

import XCTest
@testable import ChiriUtils

final class UIViewControllerTestCases: XCTestCase {
    func testViewControllerVisibility() {
        // Given
        let dummyViewController = UIViewController()

        // When
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = dummyViewController
        window.makeKeyAndVisible()

        // Then
        XCTAssert(dummyViewController.isVisible)
    }
}
