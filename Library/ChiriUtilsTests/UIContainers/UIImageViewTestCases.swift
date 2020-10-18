//
//  UIImageViewTestCases.swift
//  ChiriUtilsTests
//
//  Created by Mauricio Chirino on 18/10/20.
//  Copyright © 2020 Mauricio Chirino. All rights reserved.
//

import XCTest

final class UIImageViewTestCases: XCTestCase {
    func testImageSquareAspectRatio() {
        // Given
        let dummySquareImage = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: 200, height: 200)))
        let dummyNoneSquareImage = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: 200, height: 400)))

        // Then
        XCTAssertEqual(dummySquareImage.aspectRatio, 1)
        XCTAssertNotEqual(dummyNoneSquareImage.aspectRatio, 1)
    }
}
