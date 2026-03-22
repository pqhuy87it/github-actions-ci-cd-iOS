//
//  CICDDemoUITests.swift
//  CICDDemoUITests
//
//  Created by huy on 2026/03/22.
//

import XCTest

final class CICDDemoUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testAddition() {
        let inputA = app.textFields["inputA"]
        let inputB = app.textFields["inputB"]
        
        inputA.tap()
        inputA.typeText("10")
        
        inputB.tap()
        inputB.typeText("5")
        
        // Mặc định operation là "+" (segment đầu tiên)
        app.buttons["calculateButton"].tap()
        
        let resultLabel = app.staticTexts["resultLabel"]
        XCTAssertTrue(resultLabel.waitForExistence(timeout: 2))
        XCTAssertEqual(resultLabel.label, "15.0")
    }
    
    func testDivisionByZero() {
        let inputA = app.textFields["inputA"]
        let inputB = app.textFields["inputB"]
        
        inputA.tap()
        inputA.typeText("10")
        
        inputB.tap()
        inputB.typeText("0")
        
        // Chọn operation "÷" (segment thứ 4)
        app.buttons["÷"].tap()
        app.buttons["calculateButton"].tap()
        
        let resultLabel = app.staticTexts["resultLabel"]
        XCTAssertTrue(resultLabel.waitForExistence(timeout: 2))
        XCTAssertTrue(resultLabel.label.contains("divisionByZero"))
    }
}
