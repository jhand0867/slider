//
//  ViewController.swift
//  slider
//
//  Created by joseph on 1/26/19.
//  Copyright © 2019 joseph. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var valSC: UILabel!

    @IBOutlet weak var presetTip: UISegmentedControl!
    @IBOutlet weak var payValue: UILabel!
    @IBOutlet weak var tipValue: UILabel!
    
    @IBOutlet weak var billValue: UITextField!
    
    @IBOutlet weak var customTip: UISlider!
    
    @IBOutlet weak var customTipValue: UILabel!
    
    @IBAction func sliderValue(_ sender: UISegmentedControl) {
        
        let myValue = sender.selectedSegmentIndex
        var val1 :Double!
        var val2 :Double?
        
        val2 = Double(self.billValue.text!)
        if val2 != nil {
            val1 = val2
        } else {
            val1 = 0.00
        }
        if val1 < 0 {
            val1 = 0.00
            self.billValue.text = ""
        }
        
        switch myValue {
        case 0 :
            calc(10.0, val1)
        case 1:
            calc(15.0, val1)
            
        case 2:
            calc(18.0, val1)
            
        case 3:
            let val3 = Double(self.customTip.value)
            calc(val3, val1)
            self.presetTip.selectedSegmentIndex = 0

        default:
            valSC.text = ""
        }
        
    }
    @IBAction func displayCustomTip(_ sender: UISlider) {  // String(format: "%.01f", 3.32323242)
        self.customTipValue.text = String(format: "%.0f", self.customTip.value) + "%"
    }
    @IBAction func toPayChanged(_ sender: UITextField){
            self.sliderValue( self.presetTip)
    }
    
    @IBAction func refreshTip(_ sender: UITextField) {
        self.sliderValue( self.presetTip)
    }

    @IBAction func cleanAll(_ sender: UIButton) {
        self.billValue.text = ""
        self.presetTip.selectedSegmentIndex = 0
        self.customTip.value = 25
        self.tipValue.text = "0.00"
        self.payValue.text = "0.00"
        self.customTipValue.text = "25%"
    }
    func calc (_ tip: Double, _ toPay: Double ) {
        let tipVal = Double(Int(tip))
        let val1 = toPay * (tipVal/100)
        let val2 = (val1 + toPay)
        
        self.tipValue.text = String(format: "$%.02f", val1)
        self.payValue.text = String(format: "$%.02f", val2)
    }
}

