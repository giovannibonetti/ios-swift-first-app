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

    var isTyping = false
    
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

}

