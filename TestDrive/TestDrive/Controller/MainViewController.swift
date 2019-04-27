//
//  MainViewController.swift
//  TestDrive
//
//  Created by Mauricio Chirino on 26/04/19.
//  Copyright © 2019 Mauricio Chirino. All rights reserved.
//

import ChiriUtils

class MainViewController: UIViewController {

    lazy var tableDataSource: TableViewDataSource<Any> = {
        let tableDataSource = TableViewDataSource<Any>()
        return tableDataSource
    }()

    lazy var tableDelegate: TableViewDelegate = {
        let tableDelegate = TableViewDelegate()
        return tableDelegate
    }()

    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.estimatedRowHeight = 80
        table.rowHeight = UITableView.automaticDimension
        table.dataSource = tableDataSource
        table.delegate = tableDelegate
        table.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return table
    }()

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            ])
    }

}
