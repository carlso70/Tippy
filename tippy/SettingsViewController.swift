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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        editText.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.viewDidLoad()
    }
    
    // MARK: Navigation
    
    @IBAction func cancel(_ sender: Any) {
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInSettingsMode = presentingViewController is UINavigationController
        
        if isPresentingInSettingsMode {
            dismiss(animated: true, completion: nil)
        } else {
            // Pops the current view controller off the navigation stack of navigationController, and performs a transition
            navigationController!.popViewController(animated: true)
        }
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
