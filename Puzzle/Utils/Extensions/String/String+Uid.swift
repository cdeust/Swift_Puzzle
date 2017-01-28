//
//  String+Uid.swift
//  Puzzle
//
//  Created by User on 23/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation

extension String {
    public func uid() -> String
    {
        let uid = UUID().uuidString
        return uid
    }
}
