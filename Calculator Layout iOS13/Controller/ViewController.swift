//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//
//  collaboration: Mauricio Chaves Dias on 16/06/2021.
 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var displayLabel: UILabel!
    private var isFinishedTypingNumber = true
    private var displayValue : Double {
        get {
            //used guard to test if Double(displayLabel.text!) cannot be converted then will execute the else statement
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculatorLogic = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        
        //for every time an object is mutated a new object is created when using Structs.
        calculatorLogic.setNumber(displayValue)
        
        //catching errors from the optional calculate method
        if let calcMethod = sender.currentTitle {
            if let result = calculatorLogic.calculate(symbol: calcMethod) {
                displayValue = result
            }
        }
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                self.displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                if numValue == "." {
                    let isInt = floor(displayValue) == Double(displayLabel.text!)
                    if !isInt {
                        return
                    }
                }
                self.displayLabel.text = self.displayLabel.text! + numValue
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}
