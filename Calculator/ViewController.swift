//
//  ViewController.swift
//  Calculator
//
//  Created by YUGWANGYONG on 2/20/16.
//  Copyright © 2016 yong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTypingANumber : Bool = false
    
    var brain = CalculatorBrain()
    
    @IBAction func appendDigit(sender: UIButton) {
        // 뒤에 느낌표를 붙이면 타입이 정해진다.
        // 그 전에는 물음표가 붙어서 무슨 타입인지 정해지지 않아서 Optional 이 된다.
        // sender.currentTitle 드래그 후 option key 누르고 digit을 누르면 나옴.
        let digit = sender.currentTitle!
        // xcode 7.0 && swift 2.0 => println -> print
        print("digit = \(digit)")
        if userIsInTheMiddleOfTypingANumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
    }
    
    @IBAction func operate(sender: UIButton) {

        if userIsInTheMiddleOfTypingANumber {
            enter()
        }
        if let operation = sender.currentTitle {
            if let result = brain.performOperation(operation) {
                displayValue = result
            } else {
                displayValue = 0
            }
            
        }
       
    }
   
    var operandStack = Array<Double>()
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        if let result = brain.pushOperand(displayValue) {
            displayValue = result
        } else {
            displayValue = 0
        }
    }
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
        }
    }
}

