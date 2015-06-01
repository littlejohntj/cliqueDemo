//
//  contactTableViewController.swift
//  cliqueDemo
//
//  Created by TJ Littlejohn on 5/20/15.
//  Copyright (c) 2015 TJ Littlejohn. All rights reserved.
//

import UIKit



class contactTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var contactTableView: UITableView!
    
    let sections:Array<AnyObject> = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","#"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        println("At contactTableViewController")
        
        self.title = whoChoice?.groupName
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        var sectionTitle = sections[section] as! String
        //println(sectionTitle)
        var contacts = contactDict.dict[sectionTitle]
        println(contacts)
        return contacts!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var attrs = [NSFontAttributeName : UIFont.boldSystemFontOfSize(16)]
        
        let cell = UITableViewCell()
        
        let tableSection = contactDict.dict[sections[indexPath.section] as! String]
        let tableItem = tableSection![indexPath.row]
        
        if (sections[indexPath.section] as! String == "#") {
            cell.textLabel?.text = tableItem.phoneNumber // IF CONTACT IS ONLY A PHONE NUMBER
    } else {
            if tableItem.firstName != "" && tableItem.lastName != ""{ // IF CONTACT HAS FIRST AND LAST NAME
                
                var attributedSpace = NSMutableAttributedString(string:" ")
                var fullNameString = NSMutableAttributedString(string:tableItem.firstName!)
                var lastNameString = NSMutableAttributedString(string: tableItem.lastName!, attributes:attrs)
                fullNameString.appendAttributedString(attributedSpace)
                fullNameString.appendAttributedString(lastNameString)
                cell.textLabel?.attributedText = fullNameString
                
            } else if tableItem.firstName != "" && tableItem.lastName == ""{ // IF CONTACT HAS ONLY A FIRST NAME
                
                var firstNameString = NSMutableAttributedString(string: tableItem.firstName!, attributes:attrs)
                cell.textLabel?.attributedText = firstNameString
                
            } else if tableItem.firstName == "" && tableItem.lastName != ""{ // IF CONTACT HAS ONLY A LAST NAME
                var lastNameString = NSMutableAttributedString(string: tableItem.lastName!, attributes:attrs)
                cell.textLabel?.attributedText = lastNameString
            }
        }
        
        let contactPhoneNumber = tableItem.phoneNumber
        if whoChoice?.setOfGroupMembersNumbers.contains(contactPhoneNumber!) == true {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        
        return cell
}
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true 
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let cell = contactTableView.cellForRowAtIndexPath(indexPath)
        let tableSection = contactDict.dict[sections[indexPath.section] as! String]
        let tableItem = tableSection![indexPath.row]
        let contactPhoneNumber = tableItem.phoneNumber

        if whoChoice?.setOfGroupMembersNumbers.contains(contactPhoneNumber!) == true {
            cell!.accessoryType = UITableViewCellAccessoryType.None
            whoChoice?.setOfGroupMembersNumbers.remove(contactPhoneNumber!)
        } else {
            cell!.accessoryType = UITableViewCellAccessoryType.Checkmark
            whoChoice?.setOfGroupMembersNumbers.insert(contactPhoneNumber!)
            
        }
        
        if whoChoice?.setOfGroupMembersNumbers.isEmpty == true {
            whoChoice?.hasUserAddedMembers = false
        }else {
            whoChoice?.hasUserAddedMembers = true
        }
        
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return 27
    }
    
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [AnyObject]!{
        
        return self.sections
    }
    
    func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int{
        return index
    }
    
    func tableView(tableView: UITableView,
        titleForHeaderInSection section: Int) -> String?{
            return self.sections[section] as? String
    }
    

}
