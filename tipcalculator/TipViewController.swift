//
//  ViewController.swift
//  tipcalculator
//
//  Created by Ben Hass on 1/31/15.
//  Copyright (c) 2015 benhass. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        loadDefaults()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        var billAmount = (billField.text as NSString).doubleValue
        var tipPercentages = [0.15, 0.2, 0.25]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func loadDefaults() {
        var defaults = NSUserDefaults.standardUserDefaults()
        if var tipDefaultPercentage = defaults.integerForKey("tip_percentage_default_segment") as Int? {
            tipControl.selectedSegmentIndex = tipDefaultPercentage
        }
    }
    
}

