//
//  TableViewDataSource.swift
//  TestDrive
//
//  Created by Mauricio Chirino on 26/04/19.
//  Copyright © 2019 Mauricio Chirino. All rights reserved.
//

import ChiriUtils

class TableViewDataSource<T>: NSObject, UITableViewDataSource {

    var dataSource = [T]()

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.deque()
    }


}
