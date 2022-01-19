//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButtn: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var amountPerPerson: Float = 0.00
    var tipAmountString: String = ""
    
    @IBAction func tipAmountChange(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        tipAmountString = sender.titleLabel?.text ?? "ERROR"
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButtn.isSelected = false
        
        switch(tipAmountString) {
        case "0%":
            zeroPctButton.isSelected = true
            break
        case "10%":
            tenPctButton.isSelected = true
            break
        case "20%":
            twentyPctButtn.isSelected = true
            break
        default:
            print("ERROR")
            break
        }
    }
    
    @IBAction func tipSplitChange(_ sender: UIStepper) {
        billTextField.endEditing(true)
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        var tipAmount: Float = 0.00
        let billAmount: Float = Float(billTextField.text ?? "0.0") ?? 0.0
        let splitBetween: Int = Int(splitNumberLabel.text ?? "0") ?? 0
                    
        if tenPctButton.isSelected {
            tipAmount = billAmount * 0.10
        } else if twentyPctButtn.isSelected {
            tipAmount = billAmount * 0.20
        } else {
        }
        
        amountPerPerson = (billAmount + tipAmount) / Float(splitBetween)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.calculatedResult = amountPerPerson
            destinationVC.splitBetween = splitNumberLabel.text ?? "0"
            destinationVC.tipAmount = tipAmountString
        }
    }
}

