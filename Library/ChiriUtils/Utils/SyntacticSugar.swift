//
//  SyntacticSugar.swift
//  ChiriUtils
//
//  Created by Mauricio Chirino on 24/03/2019.
//  Copyright © 2019 Mauricio Chirino. All rights reserved.
//

import Foundation

public enum Result<T, U> where U: Error {
    case success(T)
    case failure(U)
}

// TODO: Test this
//extension Result: JSONDecodable where T == Decodable { }
