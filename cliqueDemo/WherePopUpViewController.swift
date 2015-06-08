
//
//  WherePopUpViewController.swift
//  cliqueDemo
//
//  Created by TJ Littlejohn on 6/8/15.
//  Copyright (c) 2015 TJ Littlejohn. All rights reserved.
//

import UIKit

class WherePopUpViewController: UIViewController {

    @IBOutlet weak var whereLabelTextField: UITextField!
    
    @IBOutlet weak var whereMessageTextField: UITextField!
    
    @IBOutlet weak var upDateTextLabel: UILabel!
    
    var userCameToEditEvent:Bool?
    
    @IBOutlet weak var whereTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let underlineAttribute = [NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue]
        var attributedStringOne:NSMutableAttributedString?
        var attributedStringTwo:NSMutableAttributedString?
        var gString:NSMutableAttributedString?
        
        if userCameToEditEvent! == false {
            attributedStringOne = NSMutableAttributedString(string:"T.J. Littlejohn wants to ")
            attributedStringTwo = NSMutableAttributedString(string:" with his friends later.")
            gString = NSMutableAttributedString(string: "do something fun", attributes:underlineAttribute)
            attributedStringOne!.appendAttributedString(gString!)
            attributedStringOne!.appendAttributedString(attributedStringTwo!)
            whereTitle.text = "Create a What"
        } else {
            attributedStringOne = NSMutableAttributedString(string:"T.J. Littlejohn wants to do something fun with his friends later at ")
            attributedStringTwo = NSMutableAttributedString(string:".")
            gString = NSMutableAttributedString(string: whereChoice!.whereTextMessage!, attributes:underlineAttribute)
            attributedStringOne?.appendAttributedString(gString!)
            attributedStringOne?.appendAttributedString(attributedStringTwo!)
            whereLabelTextField.text = whereChoice?.whereName
            whereMessageTextField.text = whereChoice?.whereTextMessage
            whereTitle.text = "Edit Where: \(whereChoice!.whereName!)"
        }
        
        upDateTextLabel.attributedText = attributedStringOne
    }


    func textFieldShouldReturn(textField: UITextField) -> Bool {
        whereLabelTextField.resignFirstResponder()
        whereMessageTextField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        whereLabelTextField.resignFirstResponder()
        whereMessageTextField.resignFirstResponder()
    }
    
    @IBAction func editingDidBegin(sender: UITextField) {
        whereMessageTextField.addTarget(self, action: Selector("textFieldDidChange:"), forControlEvents: UIControlEvents.EditingChanged)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidChange(theTextField:UITextField) -> Void
    {
        let underlineAttribute = [NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue]
        var userWhereTextMessage = whereMessageTextField.text
        var attributedStringOne = NSMutableAttributedString(string:"T.J. Littlejohn wants to do something fun with his friends later at ")
        var attributedStringTwo = NSMutableAttributedString(string:".")
        var attrs = [NSFontAttributeName : UIFont.boldSystemFontOfSize(20)]
        var gString = NSMutableAttributedString(string: userWhereTextMessage, attributes:underlineAttribute)
        attributedStringOne.appendAttributedString(gString)
        attributedStringOne.appendAttributedString(attributedStringTwo)
        upDateTextLabel.attributedText = attributedStringOne
        
    }
    
    @IBAction func createWhereEvent() {
        
        if userCameToEditEvent == false {
            if whereMessageTextField.text != "" && whereLabelTextField.text != "" {
                var whereEventName = whereLabelTextField.text
                var whereTextMessage = whereMessageTextField.text
                var tempWhere = Where(name: whereEventName, text: whereTextMessage)
                whatChoice?.whereArray.append(tempWhere)
                whereLabelTextField.text = ""
                whereMessageTextField.text = ""

            } else {
            }
        } else {
            if whereMessageTextField.text != "" && whereLabelTextField.text != "" {
                var whereEventName = whereLabelTextField.text
                var whereTextMessage = whereMessageTextField.text
                whereChoice?.whereName = whereEventName
                whereChoice?.whereTextMessage = whereTextMessage
            } else { }
        }
        
    }
    
    
}
