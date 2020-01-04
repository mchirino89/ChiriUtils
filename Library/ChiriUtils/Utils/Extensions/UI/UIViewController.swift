//
//  UIViewController.swift
//  ChiriUtils
//
//  Created by Mauricio Chirino on 1/4/20.
//  Copyright © 2020 Mauricio Chirino. All rights reserved.
//

public extension UIViewController {
    var isVisible: Bool {
        self.view.window != nil
    }
}
