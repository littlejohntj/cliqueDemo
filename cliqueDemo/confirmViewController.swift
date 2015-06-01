//
//  confirmViewController.swift
//  cliqueDemo
//
//  Created by TJ Littlejohn on 5/20/15.
//  Copyright (c) 2015 TJ Littlejohn. All rights reserved.
//

import UIKit
import MessageUI

class confirmViewController: UIViewController, MFMessageComposeViewControllerDelegate {

    @IBOutlet weak var whatPick: UILabel!
    
    @IBOutlet weak var wherePick: UILabel!
    
    @IBOutlet weak var whoPick: UILabel!
    
    @IBOutlet weak var whenPick: UILabel!
    
    var formText:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        whatPick.text = whatChoice?.whatName
        wherePick.text = whereChoice?.whereName
        whoPick.text = whoChoice?.groupName
        whenPick.text = whenChoice
        
        formText = userName + " want to " + whatChoice!.whatTextMessage!
        formText = formText! + " with his " + whoChoice!.groupName!
        formText = formText! + " " + whenChoice! + " at " + whereChoice!.whereTextMessage!
    }
    
    @IBAction func shareButton() {
        
        if ( MFMessageComposeViewController.canSendText() ) {
        
            let controller = MFMessageComposeViewController()
            controller.body = formText!
            controller.recipients = Array(whoChoice!.setOfGroupMembersNumbers)
            controller.messageComposeDelegate = self
            self.presentViewController(controller, animated: true, completion: nil)
            
        }
        
        
        
    }
    
    func messageComposeViewController(controller: MFMessageComposeViewController!, didFinishWithResult result: MessageComposeResult) {
        //... handle sms screen actions
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
