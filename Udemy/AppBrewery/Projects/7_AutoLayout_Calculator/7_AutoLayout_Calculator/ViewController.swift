//
//  ViewController.swift
//  7_AutoLayout_Calculator
//
//  Created by Yuseok on 29/07/2019.
//  Copyright © 2019 Yuseok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultBox: UILabel!
    var resultInStr: String = ""
    var isPositive: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultBox.text = "0.0"
        //exponent = 1.0
    }


    
    
    @IBAction func one(_ sender: UIButton) {
        resultInStr.append("1")
        updateResult()
    }
    @IBAction func two(_ sender: UIButton) {
        resultInStr.append("2")
        updateResult()
    }
    @IBAction func three(_ sender: UIButton) {
        resultInStr.append("3")
        updateResult()
    }
    @IBAction func four(_ sender: UIButton) {
        resultInStr.append("4")
        updateResult()
    }
    @IBAction func five(_ sender: UIButton) {
        resultInStr.append("5")
        updateResult()
    }
    @IBAction func six(_ sender: UIButton) {
        resultInStr.append("6")
        updateResult()
    }
    @IBAction func seven(_ sender: UIButton) {
        resultInStr.append("7")
        updateResult()
    }
    @IBAction func eight(_ sender: UIButton) {
        resultInStr.append("8")
        updateResult()
    }
    @IBAction func nine(_ sender: UIButton) {
        resultInStr.append("9")
        updateResult()
    }
    @IBAction func zero(_ sender: UIButton) {
        if resultInStr == "" {
        } else {
            resultInStr.append("0")
            updateResult()
        }
    }
    
    @IBAction func clearBox(_ sender: UIButton) {
        resultInStr = ""
        //exponent = 1.0
        updateResult()
    }
    @IBAction func pointButtone(_ sender: UIButton) {
        if resultInStr.contains(".") {
        } else {
            if resultInStr == "" {
                resultInStr.append("0.")
            } else {
                resultInStr.append(".")
            }
        }
        //exponent = 0.1
    }
    @IBAction func toggleSign(_ sender: UIButton) {
        isPositive = !isPositive
        updateResult()
    }
    
    func updateResult() {
        if resultInStr.count > 9 {
            resultInStr = String(resultInStr.dropLast())
        }
        if !isPositive {
            resultInStr.insert("-", at: resultInStr.startIndex)
        }
        resultBox.text = resultInStr
    }
}

