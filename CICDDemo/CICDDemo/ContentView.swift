//
//  ContentView.swift
//  CICDDemo
//
//  Created by huy on 2026/03/22.
//

import SwiftUI

struct ContentView: View {
    @State private var numberA = ""
    @State private var numberB = ""
    @State private var result = ""
    @State private var selectedOperation = Operation.add
    
    private let calculator = Calculator()
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Input") {
                    TextField("Number A", text: $numberA)
                        .keyboardType(.decimalPad)
                        .accessibilityIdentifier("inputA")
                    
                    TextField("Number B", text: $numberB)
                        .keyboardType(.decimalPad)
                        .accessibilityIdentifier("inputB")
                    
                    Picker("Operation", selection: $selectedOperation) {
                        ForEach(Operation.allCases) { op in
                            Text(op.symbol).tag(op)
                        }
                    }
                    .pickerStyle(.segmented)
                    .accessibilityIdentifier("operationPicker")
                }
                
                Section {
                    Button("Calculate") {
                        calculate()
                    }
                    .accessibilityIdentifier("calculateButton")
                }
                
                if !result.isEmpty {
                    Section("Result") {
                        Text(result)
                            .font(.title2.monospacedDigit())
                            .accessibilityIdentifier("resultLabel")
                    }
                }
            }
            .navigationTitle("CI/CD Calculator")
        }
    }
    
    private func calculate() {
        guard let a = Double(numberA),
              let b = Double(numberB) else {
            result = "Invalid input"
            return
        }
        
        switch selectedOperation {
        case .add:
            result = "\(calculator.add(a, b))"
        case .subtract:
            result = "\(calculator.subtract(a, b))"
        case .multiply:
            result = "\(calculator.multiply(a, b))"
        case .divide:
            switch calculator.divide(a, b) {
            case .success(let value):
                result = "\(value)"
            case .failure(let error):
                result = "Error: \(error)"
            }
        }
    }
}

enum Operation: String, CaseIterable, Identifiable {
    case add, subtract, multiply, divide
    
    var id: String { rawValue }
    
    var symbol: String {
        switch self {
        case .add:      return "+"
        case .subtract: return "−"
        case .multiply: return "×"
        case .divide:   return "÷"
        }
    }
}

#Preview {
    ContentView()
}
