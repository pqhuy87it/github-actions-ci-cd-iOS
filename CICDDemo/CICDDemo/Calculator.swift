//
//  Calculator.swift
//  CICDDemo
//
//  Created by huy on 2026/03/22.
//

import Foundation

/// Simple calculator for CI/CD demo
struct Calculator {
    
    func add(_ a: Double, _ b: Double) -> Double {
        a + b
    }
    
    func subtract(_ a: Double, _ b: Double) -> Double {
        a - b
    }
    
    func multiply(_ a: Double, _ b: Double) -> Double {
        a * b
    }
    
    func divide(_ a: Double, _ b: Double) -> Result<Double, CalculatorError> {
        guard b != 0 else {
            return .failure(.divisionByZero)
        }
        return .success(a / b)
    }
    
    func factorial(_ n: Int) -> Result<Int, CalculatorError> {
        guard n >= 0 else {
            return .failure(.negativeInput)
        }
        guard n <= 20 else {
            return .failure(.overflow)
        }
        return .success((1...max(n, 1)).reduce(1, *))
    }
}

enum CalculatorError: Error, Equatable {
    case divisionByZero
    case negativeInput
    case overflow
}
