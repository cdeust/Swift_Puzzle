//
//  XCUIElement+Paste.swift
//  Puzzle
//
//  Created by User on 24/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import XCTest

extension XCUIElement {
    func setText(text: String, application: XCUIApplication) {
        UIPasteboard.general.string = text
        doubleTap()
        application.menuItems["Paste"].tap()
    }
}
