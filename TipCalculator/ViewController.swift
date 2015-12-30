//
//  ViewController.swift
//  TipCalculator
//
//  Created by Lily on 12/28/15.
//  Copyright (c) 2015 yyclaire. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var twoPeopleShare: UILabel!
    @IBOutlet weak var threePeopleShare: UILabel!
    @IBOutlet weak var fourPeopleShare: UILabel!
    
    @IBOutlet weak var tipView: UIView!
    @IBOutlet weak var billView: UIView!
    
    @IBOutlet weak var dollarSign: UILabel!
    
    var tipPercentages = [0.18,0.20,0.22]
    var bill = 0.00
    var tip = 0.00
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //tip total amount initialization
        self.title = "Tip Calculator"
        tipAmount.text = "$0.00"
        totalAmount.text = "$0.00"
        //tipView hidden
        self.tipView.alpha = 0
        self.tipControl.alpha = 0
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //get default tip index
        let index = NSUserDefaults.standardUserDefaults()
        let tipIndex = index.integerForKey("default_tip_percentage")
        //update index
        tipControl.selectedSegmentIndex = tipIndex
        //recalculate tip & amount
        var tipSelectedPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        calcTip(tipSelectedPercentage)
       
    }
    @IBAction func onTypingAmount(sender: AnyObject) {
        //calculate tip
        var tipSelectedPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        adjustViewLayout()
        calcTip(tipSelectedPercentage)
        tipShare()
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func calcTip(percentage:Double){//helper function for calculating tip with given tip percentage
        bill = NSString(string:billAmount.text!).doubleValue
        tip = bill*percentage
        var total = bill+tip
        tipAmount.text = "$\(tip)"
        totalAmount.text = "$\(total)"
        tipAmount.text = String(format:"$%.2f",tip)
        totalAmount.text = String(format:"$%.2f",total)
        tipShare()
        
    }
    func tipShare(){
        var total = bill+tip
        var two = total / 2.0
        var three = total  / 3.0
        var four = total / 4.0
        twoPeopleShare.text = "$\(two)"
        threePeopleShare.text = "$\(three)"
        fourPeopleShare.text = "$\(four)"
         twoPeopleShare.text = String(format:"$%.2f",two)
         threePeopleShare.text = String(format:"$%.2f",three)
         fourPeopleShare.text = String(format:"$%.2f",four)
    }
    func adjustViewLayout(){
        //resize the height of bill view
        UIView.animateWithDuration(0.4, animations: {self.billView.frame.size.height = 110 // heightCon is the IBOutlet to the constraint
            self.view.layoutIfNeeded()  })
        UIView.animateWithDuration(0.4, animations: {self.tipControl.alpha = 1})
        //change font size
        dollarSign.font = dollarSign.font.fontWithSize(58)
        billAmount.font = billAmount.font.fontWithSize(58)
        dollarSign.center = CGPoint(x:100, y:20)
        billAmount.center = CGPoint(x:190, y:20)
        //show the tip view
        UIView.animateWithDuration(0.4, animations: {self.tipView.alpha = 1})
    }
    

}

