//
//  ViewController.swift
//  HesapMakinesiOdevi
//
//  Created by Doğukan Küçükler on 6.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    private var isFinishedTypingNumber : Bool = true

    private var displayValue : Double {
        
        get {
            guard let number = Double(resultLabel.text!) else {
                fatalError("gorunen text double donusturulemedi")
            }
            return number
        }
        
        set {
            resultLabel.text = String(newValue)
        }
        
    }
    
    private var calculator = CalculatorLogic()

    @IBAction func calcButtonTapped(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        if let calcMethod = sender.currentTitle {
            
            
           
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
            
        }
        
    }
    
    @IBAction func numberButtonTapped(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                resultLabel.text = numValue
                isFinishedTypingNumber = false
                
            } else {
                
                if numValue == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                resultLabel.text = resultLabel.text! + numValue
            }
            
        }
        
    }
    
        
    }
