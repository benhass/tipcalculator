//
//  SettingsViewController.swift
//  tipcalculator
//
//  Created by Ben Hass on 2/1/15.
//  Copyright (c) 2015 benhass. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDefaults()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        saveDefaults()
    }
    
    func loadDefaults() {
        var defaults = NSUserDefaults.standardUserDefaults()
        if var tipDefaultPercentage = defaults.integerForKey("tip_percentage_default_segment") as Int? {
            defaultTipControl.selectedSegmentIndex = tipDefaultPercentage
        }
    }
    
    func saveDefaults() {
        var tipPercentageDefaultSegment = defaultTipControl.selectedSegmentIndex
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(tipPercentageDefaultSegment, forKey: "tip_percentage_default_segment")
        defaults.synchronize()
    }
}
