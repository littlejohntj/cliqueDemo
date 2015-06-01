//
//  whoViewController.swift
//  cliqueDemo
//
//  Created by TJ Littlejohn on 5/15/15.
//  Copyright (c) 2015 TJ Littlejohn. All rights reserved.
//

import UIKit

class whoViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var whoCollectionView: UICollectionView!
    
    var passIndexPath:NSIndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return whoGroupArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:whoCollViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("whoCell", forIndexPath: indexPath) as! whoCollViewCell
        
        
        cell.backgroundColor = mainColor
        cell.groupName.text = whoGroupArray[indexPath.row].groupName
        
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        whoChoice = whoGroupArray[indexPath.row]
        println(index)
        if whoGroupArray[indexPath.row].hasUserAddedMembers == false {
            let disiredViewController = self.storyboard?.instantiateViewControllerWithIdentifier("contactTableViewController") as! contactTableViewController
            self.navigationController?.pushViewController(disiredViewController, animated: true)
        } else {
            let disiredViewController = self.storyboard?.instantiateViewControllerWithIdentifier("whenViewController") as! whenViewController
            self.navigationController?.pushViewController(disiredViewController, animated: true)
        }
    }
    
   
    
    @IBAction func longGesture(sender: UIGestureRecognizer) {
        
        
        if sender.state == UIGestureRecognizerState.Began
        {
            let location = sender.locationInView(sender.view)
            println(location)
            let index = whoCollectionView.indexPathForItemAtPoint(location)
            println(index)
            whoChoice = whoGroupArray[index!.row]
            
            let disiredViewController = self.storyboard?.instantiateViewControllerWithIdentifier("contactTableViewController") as! contactTableViewController
            self.navigationController?.pushViewController(disiredViewController, animated: true)
            
        }
        
    }
    
}
