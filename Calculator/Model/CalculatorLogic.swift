//
//  CalculatorModule.swift
//  Calculator
//
//  Created by Nipun Garg on 11/09/2018.
//  Copyright Nipun Garg. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    private var intermediateCalculation : (initialNumber: Double, operation: String)?
    
    mutating func setNumber(_ number:Double) {
        self.number = number
    }
    
    mutating func calculate(symbol:String) -> Double? {
        if let n = number {
            if symbol == "+/-" {
                return n * -1
            } else if symbol == "AC" {
                return 0
            } else if  symbol == "%" {
                return n/100
            } else if symbol == "=" {
                return performTwoNumberOpeartion(secondNumber: n)
            } else {
                self.intermediateCalculation = (initialNumber: n, operation : symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumberOpeartion(secondNumber:Double) -> Double? {
        if let n1 = self.intermediateCalculation?.initialNumber, let operation = self.intermediateCalculation?.operation {
            switch operation {
            case "+" :
                return n1 + secondNumber
            case "-" :
                return n1 - secondNumber
            case "×" :
                return n1 * secondNumber
            case "÷" :
                return n1 / secondNumber                
            default:
                fatalError("Error")
            }
        }
        return nil
    }
}
