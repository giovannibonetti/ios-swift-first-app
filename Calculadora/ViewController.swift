//
//  ViewController.swift
//  Calculadora
//
//  Created by Giovanni K Bonetti on 29/09/15.
//  Copyright © 2015 Giovanni K Bonetti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!

    var stack: [Double] = []
    
    var isTyping = false

    var displayValue: Double {
        get {
            return NSNumberFormatter()
                .numberFromString(display.text!)!
                .doubleValue
        }
        set {
            display.text = "\(newValue)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        display.text = "0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func appendDigit(sender: UIButton) {
        let currentDigit = sender.currentTitle!

        if isTyping {
            display.text = display.text! + currentDigit
        } else {
            display.text = currentDigit
            isTyping = true
        }
    }

    @IBAction func enter(sender: UIButton) {
        isTyping = false
        stack.append(displayValue)
        display.text = "0"

        print("Stack atual: \(stack)")
    }

    @IBAction func operate(sender: UIButton) {
        //Obtemos se F é {+} {-} {X} ou {/}
        isTyping = false
        let operation = sender.currentTitle
        if stack.count < 2 {
            return
        }
        let last: Double = stack.removeLast()
        let first: Double = stack.removeLast()

        switch operation! {
            case "+":
                displayValue = first + last
            case "-":
                displayValue = first - last
            case "X":
                displayValue = first * last
            case "/":
                displayValue = first / last
            default:
                break
        }
    }
}

