//
//  CalculatorLogic.swift
//  Calculator Layout iOS13
//
//  Created by Mauricio Dias on 16/6/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {

    private var number: Double?
    
    private var intermidiateCalculation: (firstNumbers: Double, calcMethod: String)?

    mutating func setNumber(_ number: Double){
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let safeNumber = number {
            switch symbol {
            case "+/-":
                return safeNumber * -1
            case "AC":
                return 0
            case "%":
                return safeNumber * 0.01
            case "=":
                return performTwoNumCalculation(n2: safeNumber)
            default:
                intermidiateCalculation = (firstNumbers: safeNumber, calcMethod: symbol)
            }
        }
        return nil
    }
    
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        //unwrapping the tuple
        if let n1 = intermidiateCalculation?.firstNumbers,
           let operation = intermidiateCalculation?.calcMethod {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "÷":
                return n1 / n2
            case "×":
                return n1 * n2
            default:
                 fatalError("The operation passed in does not match an of the cases.")
            }
        }
        return nil
    }
    
}

