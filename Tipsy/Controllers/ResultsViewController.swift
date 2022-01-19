//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Cory Carte on 1/19/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var calculatedResult: Float = 0.0
    var splitBetween: String = "0"
    var tipAmount: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = String(format: "%.2f", calculatedResult)
        settingsLabel.text = "Split between \(splitBetween) people, with \(tipAmount) tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
