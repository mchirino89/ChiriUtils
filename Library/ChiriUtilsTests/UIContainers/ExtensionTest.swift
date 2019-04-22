//
//  ExtensionTest.swift
//  ChiriUtilsTests
//
//  Created by Mauricio Chirino on 21/04/2019.
//  Copyright © 2019 Mauricio Chirino. All rights reserved.
//

import XCTest

class ExtensionTest: XCTestCase {

    let dummyFrame = CGRect(origin: .zero, size: CGSize(width: 0, height: 0))

    func testTableDequeue() {
        let testTableView = UITableView(frame: dummyFrame, style: .plain)
        testTableView.register(cellType: TestTableViewCell.self)
        let dequeued: TestTableViewCell = testTableView.deque()
        XCTAssert(dequeued.isKind(of: TestTableViewCell.self))
    }

    func testCollectionDequeue() {
        let testCollectionView = UICollectionView(frame: dummyFrame, collectionViewLayout: .init())
        testCollectionView.register(cellType: TestCollectionViewCell.self)
        let dequeued: TestCollectionViewCell = testCollectionView.deque(at: IndexPath(row: 0,
                                                                                      section: 0))
        XCTAssert(dequeued.isKind(of: TestCollectionViewCell.self))
    }

}
