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

var passViewController:UIViewController?

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIPopoverPresentationControllerDelegate {

    
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    override func viewDidLoad() {
        self.navigationController!.navigationBar.barTintColor = UIColor(0x03A9F4)
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()

        
       // self.myCollectionView.backgroundColor = UIColor.whiteColor()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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
        if segue.identifier == "toWhere" {
            let index = myCollectionView.indexPathForCell(sender! as! UICollectionViewCell)!
            let whatItem = whatCollection[index.row]
            
            let vc: whereViewController = segue.destinationViewController as! whereViewController
            vc.whereCollection = whatItem.whereArray            
        }
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
        popOverVC.preferredContentSize = CGSizeMake(300, 400)
        popOverVC.modalPresentationStyle = .Popover
        
        let popover = popOverVC.popoverPresentationController!
        popover.delegate = self
        popover.sourceView  = self.view
        popover.barButtonItem = sender
        popover.permittedArrowDirections = .Up | .Down
        presentViewController(popOverVC, animated: true, completion: nil)
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
    
    func popoverPresentationControllerDidDismissPopover(popoverPresentationController: UIPopoverPresentationController){
        println("How does this work??")
        self.myCollectionView.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        println("this should work?")
    }
    
    
    
    
}

