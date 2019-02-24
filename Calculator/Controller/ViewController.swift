//
//  ViewController.swift
//  Calculator
//
//  Created by Nipun Garg on 10/09/2018.
//  Copyright Nipun Garg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    private var firstNumber: Double = 0.0
    private var isDecimalTyped : Bool = false
    
    private var value = CalculatorLogic()
    
    private var displayValue : Double {
        get {
            guard let currentDisplayValue = Double(displayLabel.text!) else {
                fatalError("Cannot display label text in Double.")
            }
            return currentDisplayValue
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        
        if let calMethod = sender.currentTitle {
            value.setNumber(displayValue)
            if let v = value.calculate(symbol: calMethod) {
                displayValue = v
            }

//            if calMethod == "+/-" {
//                displayValue = displayValue * -1
//            } else if calMethod == "AC" {
//                displayLabel.text = "0"
//                firstNumber = 0.0
//            } else if  calMethod == "%" {
//                displayValue = displayValue/100
//            }
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let newValue = sender.currentTitle {
            if isFinishedTypingNumber == true {
                isFinishedTypingNumber = false
                displayLabel.text = newValue
            } else {
                if newValue == "." {
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                
                displayLabel.text = displayLabel.text! + newValue
            }
        }
    }
}

