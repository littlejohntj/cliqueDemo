//
//  WhatPopUpViewController.swift
//  cliqueDemo
//
//  Created by TJ Littlejohn on 5/30/15.
//  Copyright (c) 2015 TJ Littlejohn. All rights reserved.
//

import UIKit

class WhatPopUpViewController: UIViewController {

    // MARK: OUTLETS
    
    @IBOutlet weak var whatLabelTextField: UITextField!
    
    @IBOutlet weak var whatMessageTextField: UITextField!
    
    @IBOutlet weak var upDateTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let underlineAttribute = [NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue]
        var attributedStringOne = NSMutableAttributedString(string:"T.J. Littlejohn wants to ")
        var attributedStringTwo = NSMutableAttributedString(string:" with his friends later.")
        var gString = NSMutableAttributedString(string: "do something fun", attributes:underlineAttribute)
        attributedStringOne.appendAttributedString(gString)
        attributedStringOne.appendAttributedString(attributedStringTwo)
        upDateTextLabel.attributedText = attributedStringOne
    }

    // MARK: Drop Keyboard Functions
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        whatLabelTextField.resignFirstResponder()
        whatMessageTextField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        whatLabelTextField.resignFirstResponder()
        whatMessageTextField.resignFirstResponder()
    }
    
    @IBAction func editingDidBegin(sender: UITextField) {
        whatMessageTextField.addTarget(self, action: Selector("textFieldDidChange:"), forControlEvents: UIControlEvents.EditingChanged)
    }
    
    func textFieldDidChange(theTextField:UITextField) -> Void
    {
//        var userWhatTextMessage = whatMessageTextField.text
//        let underlineAttribute = [NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue]
//        let underlineAttributedString = NSAttributedString(string: userWhatTextMessage, attributes: underlineAttribute)
//
//        //upDateTextLabel.text = userName + " want to " + underlineAttributedString + " with his friends later."
//        upDateTextLabel.attributedText = underlineAttributedString
        let underlineAttribute = [NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue]
        var userWhatTextMessage = whatMessageTextField.text
        var attributedStringOne = NSMutableAttributedString(string:"T.J. Littlejohn wants to ")
        var attributedStringTwo = NSMutableAttributedString(string:" with his friends later.")
        var attrs = [NSFontAttributeName : UIFont.boldSystemFontOfSize(20)]
        var gString = NSMutableAttributedString(string: userWhatTextMessage, attributes:underlineAttribute)
        attributedStringOne.appendAttributedString(gString)
        attributedStringOne.appendAttributedString(attributedStringTwo)
        upDateTextLabel.attributedText = attributedStringOne
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createWhatEvent() {
        
        if whatMessageTextField.text != "" && whatLabelTextField.text != "" {
        var whatEventName = whatLabelTextField.text
        var whatTextMessage = whatMessageTextField.text
            
        var tempWhat = What(name: whatEventName, text: whatTextMessage, whereArr: whereCollectionTwo)
        whatCollection.append(tempWhat)
        whatLabelTextField.text = ""
        whatMessageTextField.text = ""
        //self.dismissViewControllerAnimated(true, completion: nil)
        
        }
    }
    
    
}
