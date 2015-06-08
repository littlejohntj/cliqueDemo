//
//  whereViewController.swift
//  cliqueDemo
//
//  Created by TJ Littlejohn on 5/15/15.
//  Copyright (c) 2015 TJ Littlejohn. All rights reserved.
//

import UIKit

class whereViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIPopoverPresentationControllerDelegate {
    
    @IBOutlet weak var whereCollectionView: UICollectionView!
    
    @IBOutlet weak var addWhereBarButton: UIBarButtonItem!
    //var whereCollection: [Where] = [Where]()
    
    let blur = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Dark))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        blur.frame = view.frame
        view.addSubview(blur)
        blur.hidden = true
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        println(whatChoice)
        return whatChoice!.whereArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:whereCollViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! whereCollViewCell
        
        cell.whereLabel.text = whatChoice?.whereArray[indexPath.row].whereName
        
        println(whatChoice?.whereArray.count)
        
        cell.backgroundColor = mainColor
        
        //println(whereCollection[indexPath.row].whereName)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        whereChoice = whatChoice?.whereArray[indexPath.row]
        println(whereChoice?.whereName)
    }
    
    @IBAction func pop(sender: UIBarButtonItem) {
        let popOverVC = storyboard?.instantiateViewControllerWithIdentifier("WherePopUpViewController") as! WherePopUpViewController!
        popOverVC.preferredContentSize = CGSizeMake(300, 400)
        popOverVC.modalPresentationStyle = .Popover
        
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
            whatChoice?.whereArray[saveRow!] = whereChoice!
            whereChoice = nil
            saveRow = nil
        }
        self.whereCollectionView.reloadData()
    }
    
    @IBAction func longPress(sender: UILongPressGestureRecognizer) {
        
        if sender.state == UIGestureRecognizerState.Began
        {
            let location = sender.locationInView(sender.view)
            println(location)
            let index = whereCollectionView.indexPathForItemAtPoint(location)
            let cellName = whatChoice!.whereArray[index!.row].whereName
            
            let alertController = UIAlertController(title: "Manage Where: \(cellName!)", message: "What would you like to do?", preferredStyle: .Alert)
            
            self.presentViewController(alertController, animated: true) {
                
            }
            
            let oneAction = UIAlertAction(title: "Edit \(cellName!)", style: .Default) { (_) in
                whereChoice = whatChoice?.whereArray[index!.row]
                saveRow = index!.row
                self.editWhereEvent((index?.row)!)
            }
            
            let twoAction = UIAlertAction(title: "Delete \(cellName!)", style: .Default) { (_) in
                self.deleteWhereEvent((index?.row)!)
                saveRow = index!.row
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (_) in }
            
            alertController.addAction(oneAction)
            alertController.addAction(twoAction)
            alertController.addAction(cancelAction)
            
        }
        
    }
    
    func editWhereEvent(index: Int) {
        println("Edit")
        let popOverVC = storyboard?.instantiateViewControllerWithIdentifier("WherePopUpViewController") as! WherePopUpViewController!
        popOverVC.preferredContentSize = CGSizeMake(300, 350)
        popOverVC.modalPresentationStyle = .Popover
        popOverVC.userCameToEditEvent = true
        let popover = popOverVC.popoverPresentationController!
        popover.delegate = self
        popover.sourceView  = self.view
        popover.barButtonItem = addWhereBarButton
        popover.permittedArrowDirections = .Any
        blur.hidden = false
        presentViewController(popOverVC, animated: true, completion: nil)
    }
    
    func deleteWhereEvent(index: Int) {
        whatChoice?.whereArray.removeAtIndex(index) // BUG IS THAT IT ONLY REMOVES IT FOR THAT SPECIFIC WHAT CHOICE. WILL NEED TO CHANGE THE WAY WHERES ARE PUT INTO WHATS AND IF THERE FOR EVERY WHAT OR SPECIFIC WHATS TO FIX THE BUG
        self.whereCollectionView.reloadData()
    }
    
    
    

}
