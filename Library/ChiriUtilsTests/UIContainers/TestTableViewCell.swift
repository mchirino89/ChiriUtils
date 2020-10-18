//
//  TestTableViewCell.swift
//  ChiriUtilsTests
//
//  Created by Mauricio Chirino on 21/04/2019.
//  Copyright © 2019 Mauricio Chirino. All rights reserved.
//

import UIKit

final class TestTableViewCell: UITableViewCell {
    var testAttribute: String?
    var cellId: String {
        return String(describing: self)
    }
}
