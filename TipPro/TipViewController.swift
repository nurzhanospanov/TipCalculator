//
//  TipViewController.swift
//  TipPro
//
//  Created by nurzhan on 9/3/16.
//  Copyright © 2016 Nurzhan. All rights reserved.
//

import Foundation
import UIKit

class TipViewController: UIViewController  {
    
    
    @IBOutlet weak var billAmountField: UITextField!
    
    @IBOutlet weak var tipSelector: UISegmentedControl!
    
    @IBOutlet weak var tipAmountLabel: UILabel!
    
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    @IBOutlet weak var calculateButton: UIButton!
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // setting placeholder text font
        
        billAmountField.attributedPlaceholder = NSAttributedString(string:"0", attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()])
        // setting calculate button frame
        calculateButton.backgroundColor = UIColor.clearColor()
        calculateButton.layer.cornerRadius = 1
        calculateButton.layer.borderWidth = 2
        calculateButton.layer.borderColor = UIColor.whiteColor().CGColor
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateTip(sender: AnyObject) {
                guard let billAmount = Double(billAmountField.text!) else {
                    //show error
                    billAmountField.text = ""
                    tipAmountLabel.text = ""
                    totalAmountLabel.text = ""
                    return
        
    }
    
        
        var tipPercentage = 0.0
        
        switch tipSelector.selectedSegmentIndex {
        case 0:
            tipPercentage = 0.15
        case 1:
            tipPercentage = 0.18
        case 2:
            tipPercentage = 0.20
        default:
            break
        }
    
        let roundedBillAmount = round(100*billAmount)/100
        let tipAmount = roundedBillAmount * tipPercentage
        let roundedTipAmount = round(100*tipAmount)/100
        let totalAmount = roundedBillAmount + roundedTipAmount
        
        if (!billAmountField.editing) {
            billAmountField.text = String(format: "%.2f", roundedBillAmount)
        }
        tipAmountLabel.text = String(format: "%.2f", roundedTipAmount)
        totalAmountLabel.text = String(format: "%.2f", totalAmount)
        
    }
}
