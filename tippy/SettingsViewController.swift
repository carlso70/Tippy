//
//  settingsViewController.swift
//  tippy
//
//  Created by James Carlson on 11/23/16.
//  Copyright © 2016 James Carlson. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var editText: UITextField!
    @IBOutlet weak var done: UIBarButtonItem!
    @IBOutlet weak var cancel: UIBarButtonItem!
    
    var tipPercentages: [Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(tipPercentages)
        
        // Set the titles of the tipControl
        for index in 0...2 {
            let title = String.init(format: "%2d%%", (Int)(tipPercentages[index] * 100))
            tipControl.setTitle(title, forSegmentAt: index)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.viewDidLoad()
    }
    
    // MARK: Navigation
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    // MARK: Edit Tip
    @IBAction func editTip(_ sender: Any) {
        if let tip = (Double)(editText.text!) {
            tipPercentages[tipControl.selectedSegmentIndex] = tip/100
            print(tipPercentages)
            tipControl.setTitle("\(editText.text!)%", forSegmentAt: tipControl.selectedSegmentIndex)
        }
    }
    
    
    
    
}
