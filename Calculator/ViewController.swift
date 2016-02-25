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
        let operation = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            enter()
        }
        switch operation {
            case "×": performOperation{ $0 * $1 }
            case "÷": performOperation{ $0 / $1 }
            case "+": performOperation{ $0 + $1 }
            case "−": performOperation{ $0 - $1 }
            case "√": performOperation1{ sqrt($0) }
        default: break
        }
    }
    
    func performOperation(operation: (Double, Double) -> Double){
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }

    func performOperation1(operation: Double -> Double){
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }

    var operandStack = Array<Double>()
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
        print("operandStack = \(operandStack)")
    }
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
}

