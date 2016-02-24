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
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
    }
    
}

