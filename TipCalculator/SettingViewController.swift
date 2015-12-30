//
//  SettingViewController.swift
//  TipCalculator
//
//  Created by Lily on 12/30/15.
//  Copyright (c) 2015 yyclaire. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let defaultTipIndex = NSUserDefaults.standardUserDefaults()
        var tipIndex = defaultTipIndex.integerForKey("default_tip_percentage")
        defaultTipControl.selectedSegmentIndex = tipIndex
           }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func resetDefault(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        var tipIndex = defaultTipControl.selectedSegmentIndex
        defaults.setInteger(tipIndex, forKey: "default_tip_percentage")
        defaults.synchronize()

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
