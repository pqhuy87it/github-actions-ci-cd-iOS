//
//  CICDDemoTests.swift
//  CICDDemoTests
//
//  Created by huy on 2026/03/22.
//

import XCTest
@testable import CICDDemo

final class CalculatorTests: XCTestCase {
    
    private var sut: Calculator!
    
    override func setUp() {
        super.setUp()
        sut = Calculator()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Add
    
    func testAdd_positiveNumbers() {
        XCTAssertEqual(sut.add(2, 3), 5)
    }
    
    func testAdd_negativeNumbers() {
        XCTAssertEqual(sut.add(-2, -3), -5)
    }
    
    func testAdd_zero() {
        XCTAssertEqual(sut.add(0, 5), 5)
    }
    
    // MARK: - Subtract
    
    func testSubtract() {
        XCTAssertEqual(sut.subtract(10, 3), 7)
    }
    
    func testSubtract_negativeResult() {
        XCTAssertEqual(sut.subtract(3, 10), -7)
    }
    
    // MARK: - Multiply
    
    func testMultiply() {
        XCTAssertEqual(sut.multiply(4, 5), 20)
    }
    
    func testMultiply_byZero() {
        XCTAssertEqual(sut.multiply(100, 0), 0)
    }
    
    // MARK: - Divide
    
    func testDivide_success() {
        let result = sut.divide(10, 2)
        XCTAssertEqual(try result.get(), 5)
    }
    
    func testDivide_byZero_returnsError() {
        let result = sut.divide(10, 0)
        
        switch result {
        case .success:
            XCTFail("Expected division by zero error")
        case .failure(let error):
            XCTAssertEqual(error, .divisionByZero)
        }
    }
    
    // MARK: - Factorial
    
    func testFactorial_zero() {
        XCTAssertEqual(try sut.factorial(0).get(), 1)
    }
    
    func testFactorial_five() {
        XCTAssertEqual(try sut.factorial(5).get(), 120)
    }
    
    func testFactorial_negativeInput_returnsError() {
        let result = sut.factorial(-1)
        
        switch result {
        case .success:
            XCTFail("Expected negative input error")
        case .failure(let error):
            XCTAssertEqual(error, .negativeInput)
        }
    }
    
    func testFactorial_overflow_returnsError() {
        let result = sut.factorial(21)
        
        switch result {
        case .success:
            XCTFail("Expected overflow error")
        case .failure(let error):
            XCTAssertEqual(error, .overflow)
        }
    }
}
