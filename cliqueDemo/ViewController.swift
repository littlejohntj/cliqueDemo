//
//  ViewController.swift
//  cliqueDemo
//
//  Created by TJ Littlejohn on 5/15/15.
//  Copyright (c) 2015 TJ Littlejohn. All rights reserved.
//

import UIKit

var textInformation:[String] = [String]()
var whoGroupArray:[whoGroup] = [whoGroup]()
var whenGroupArray:[String] = ["Now","Later", "Tomorrow", "Monday", "Whenever"]

var whatChoice:What?
var whoChoice:whoGroup?
var whereChoice:Where?
var whenChoice:String?

let mainColor:UIColor = UIColor.blueColor()

var userName = "TJ Littlejohn"

var whatCollection: [What] = [What]()
var whereCollectionOne: [Where] = [Where]()
var whereCollectionTwo: [Where] = [Where]()

var saveRow:Int?

var passViewController:UIViewController?

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var addWhatBarButton: UIBarButtonItem!
    
    let blur = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Dark))
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    override func viewDidLoad() {
        self.navigationController!.navigationBar.barTintColor = UIColor(0x03A9F4)
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()

        
       // self.myCollectionView.backgroundColor = UIColor.whiteColor()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        blur.frame = view.frame
        view.addSubview(blur)
        blur.hidden = true
        
        self.loadWheres()
        self.loadWhats()
        self.loadWhoGroup()
        self.myCollectionView.reloadData()
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return whatCollection.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:CollViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CollViewCell
        
        //cell.setWhatItem(whatCollection[indexPath.row])
        
        cell.backgroundColor = mainColor
        
        cell.labelCell.text = whatCollection[indexPath.row].whatName
        
        println(whatCollection[indexPath.row].whatName)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        whatChoice = whatCollection[indexPath.row]
        
    }
    
    func loadWheres() {
        var whereOne =  Where(name: "Home", text: "my house")
        var whereTwo = Where(name: "School", text: "school")
        var whereThree = Where(name: "Park", text: "the park")
        var whereFour = Where(name: "Gym", text: "the gym")
        
        var whereFive =  Where(name: "Golds", text: "golds")
        var whereSix = Where(name: "CS Lab", text: "the computer science lab")
        var whereSeven = Where(name: "Rez", text: "the FSU rez")
        var whereEight = Where(name: "Mobile", text: "the Mobile Lab")
        
        whereCollectionOne.append(whereOne)
        whereCollectionOne.append(whereTwo)
        whereCollectionOne.append(whereThree)
        whereCollectionOne.append(whereFour)
        
        whereCollectionTwo.append(whereFive)
        whereCollectionTwo.append(whereSix)
        whereCollectionTwo.append(whereSeven)
        whereCollectionTwo.append(whereEight)

    }
    
    func loadWhats() {
        var whatOne = What(name: "Workout", text: "go workout", whereArr: whereCollectionOne)
        var whatTwo = What(name: "Bike", text: "go ride bikes", whereArr: whereCollectionOne)
        var whatThree = What(name: "Run", text: "go running", whereArr: whereCollectionTwo)
        var whatFour = What(name: "Swim", text: "go swim", whereArr: whereCollectionTwo)
        var whatFive = What(name: "Drink", text: "go drink", whereArr: whereCollectionTwo)
        var whatSix = What(name: "Soccer", text: "play Soccer", whereArr: whereCollectionTwo)
        var whatSeven = What(name: "Basketball", text: "ball out", whereArr: whereCollectionTwo)
        var whatEight = What(name: "Swoop", text: "pick up da bitches", whereArr: whereCollectionTwo)
        
        whatCollection.append(whatOne)
        whatCollection.append(whatTwo)
        whatCollection.append(whatThree)
        whatCollection.append(whatFour)
        whatCollection.append(whatFive)
        whatCollection.append(whatSix)
        whatCollection.append(whatSeven)
        whatCollection.append(whatEight)

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "toWhere" {
//            let index = myCollectionView.indexPathForCell(sender! as! UICollectionViewCell)!
//            let whatItem = whatCollection[index.row]
//            let vc: whereViewController = segue.destinationViewController as! whereViewController
//        }
    }
    
    func loadWhoGroup() {
        var whoGroupNames = ["Bros","Girls", "Gamers", "Family", "Biology Group", "Physics Group", "CS Group", "Crew", "Roommates", "Boo"]
        
        for groups in whoGroupNames{
            var newGroup = whoGroup(name: groups)
            whoGroupArray.append(newGroup)
            
        }
    }
    
    // MARK: Pop UP View Controller Functions
    @IBAction func pop(sender: UIBarButtonItem) {
        let popOverVC = storyboard?.instantiateViewControllerWithIdentifier("WhatPopUpViewController") as! WhatPopUpViewController!
        popOverVC.preferredContentSize = CGSizeMake(300, 350)
        popOverVC.modalPresentationStyle = .Popover
        popOverVC.userCameToEditEvent = false
        let popover = popOverVC.popoverPresentationController!
        popover.delegate = self
        popover.sourceView  = self.view
        popover.barButtonItem = sender
        popover.permittedArrowDirections = .Up | .Down
        blur.hidden = false
        presentViewController(popOverVC, animated: true, completion: nil)
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
    
    func popoverPresentationControllerDidDismissPopover(popoverPresentationController: UIPopoverPresentationController){
        blur.hidden = true
        if saveRow != nil {
            whatCollection[saveRow!] = whatChoice!
            whatChoice = nil
            saveRow = nil
            println("FUCK WE FOUND A BUG")
        }
        self.myCollectionView.reloadData()
    }
    
    func addBlur() {
        blur.hidden = false
    }
    
    @IBAction func longGesture(sender: UIGestureRecognizer) {
        
        
        if sender.state == UIGestureRecognizerState.Began
        {
            let location = sender.locationInView(sender.view)
            println(location)
            let index = myCollectionView.indexPathForItemAtPoint(location)
            let cellName = whatCollection[index!.row].whatName

            
            let alertController = UIAlertController(title: "Manage What: \(cellName!)", message: "What would you like to do?", preferredStyle: .Alert)
            
            self.presentViewController(alertController, animated: true) {
                
            }
            
            let oneAction = UIAlertAction(title: "Edit \(cellName!)", style: .Default) { (_) in
                whatChoice = whatCollection[index!.row]
                saveRow = index!.row
                self.editWhatEvent((index?.row)!)
            }
            
            let twoAction = UIAlertAction(title: "Delete \(cellName!)", style: .Default) { (_) in
                self.deleteWhatEvent((index?.row)!)
                saveRow = index!.row
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (_) in }
            
            alertController.addAction(oneAction)
            alertController.addAction(twoAction)
            alertController.addAction(cancelAction)
            
        }
        
    }
    
    func editWhatEvent(index: Int) {
        println("Edit")
        let popOverVC = storyboard?.instantiateViewControllerWithIdentifier("WhatPopUpViewController") as! WhatPopUpViewController!
        popOverVC.preferredContentSize = CGSizeMake(300, 350)
        popOverVC.modalPresentationStyle = .Popover
        popOverVC.userCameToEditEvent = true
        let popover = popOverVC.popoverPresentationController!
        popover.delegate = self
        popover.sourceView  = self.view
        popover.barButtonItem = addWhatBarButton
        popover.permittedArrowDirections = .Any
        blur.hidden = false
        presentViewController(popOverVC, animated: true, completion: nil)
    }
    
    func deleteWhatEvent(index: Int) {
        whatCollection.removeAtIndex(index)
        self.myCollectionView.reloadData()
    }
    
    
    
}

