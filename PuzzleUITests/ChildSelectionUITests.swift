//
//  ChildSelectionUITests.swift
//  Puzzle
//
//  Created by User on 25/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import XCTest

class ChildSelectionUITests: XCTestCase {
        
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app.launch()
        print(app.debugDescription)
    }
    
    func testChildSelectionUIElementsExists() {
        let email = app.textFields.element(matching: .textField, identifier: "email")
        email.tap()
        email.typeText("test@integration.com")
        email.typeText("\n")
        
        let password = app.secureTextFields.element(matching: .secureTextField, identifier: "password")
        password.tap()
        password.typeText("testme")
        password.typeText("\n")
        
        app.buttons["Login"].tap()
        
        XCTAssert(app.staticTexts["Welcome test!"].exists)
        XCTAssert(app.buttons["Add children"].exists)
        XCTAssert(app.buttons["Log out"].exists)
    }
    
    func testChildSelectionLogoutButton() {
        let email = app.textFields.element(matching: .textField, identifier: "email")
        email.tap()
        email.typeText("test@integration.com")
        email.typeText("\n")
        
        let password = app.secureTextFields.element(matching: .secureTextField, identifier: "password")
        password.tap()
        password.typeText("testme")
        password.typeText("\n")
        
        app.buttons["Login"].tap()
        app.buttons["Log out"].tap()
        
        XCTAssert(app.staticTexts["Email"].exists)
        XCTAssert(app.staticTexts["Password"].exists)
        XCTAssert(app.buttons["Create"].exists)
        XCTAssert(app.buttons["Login"].exists)
    }
    
    override func tearDown() {
        super.tearDown()
    }
}
