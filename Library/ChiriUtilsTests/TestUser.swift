//
//  TestUser.swift
//  ChiriUtilsTests
//
//  Created by Mauricio Chirino on 19/04/2019.
//  Copyright © 2019 Mauricio Chirino. All rights reserved.
//

import Foundation

struct TestUser: Codable {
    let name: String
    let age: Int
    let birthday: Int

    init() {
        name = "Mauricio Chirino"
        age = 29
        birthday = 620319600
    }
}

extension TestUser {
    static func ==(lhs: TestUser, rhs: TestUser) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age && lhs.birthday == rhs.birthday
    }
}
