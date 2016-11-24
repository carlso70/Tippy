//
//  ViewController.swift
//  tippy
//
//  Created by James Carlson on 11/21/16.
//  Copyright © 2016 James Carlson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!

    var tipPercentages = [0.18, 0.2, 0.25]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateTipControl()
    }
    
    func updateTipControl() {
        if tipPercentages.count != 3 {
            print("ERROR TIP PERCENTAGES COUNT IS != 3")
            return
        }
        
        for index in 0...2 {
            let title = String.init(format: "%2d%%", (Int)(tipPercentages[index] * 100))
            tipControl.setTitle(title, forSegmentAt: index)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        // Dismisses keyborad on tap
        view.endEditing(true)
    }
   
    @IBAction func tipControlChanged(_ sender: Any) {
        self.calculateTip(Any)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String.init(format: "$%.2f", tip)
        totalLabel.text = String.init(format: "$%.2f", total)
        
    }

    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editSettings" {
            /*
            let controller = segue.destination as! UINavigationController
            let settingsController = controller.viewControllers.first as! SettingsViewController
            */
            let settingsController = segue.destination as! SettingsViewController
            
            settingsController.tipPercentages = self.tipPercentages
        }
    }
    
    @IBAction func unwindToTipView(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? SettingsViewController{
            tipPercentages = sourceViewController.tipPercentages
            updateTipControl()
        }
    }    
    
}

