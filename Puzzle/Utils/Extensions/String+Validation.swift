//
//  String+Validation.swift
//  Puzzle
//
//  Created by User on 24/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import UIKit

extension String {
    public func isEmptyOrNil(string: String) -> Bool {
        return string.isEmpty || "" == string.trim()
    }
    
    public func isNotEmptyNorNil(string: String) -> Bool {
        return !isEmptyOrNil(string: string)
    }
    
    public func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
}
