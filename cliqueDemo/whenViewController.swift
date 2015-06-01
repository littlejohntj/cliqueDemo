//
//  whenViewController.swift
//  cliqueDemo
//
//  Created by TJ Littlejohn on 5/20/15.
//  Copyright (c) 2015 TJ Littlejohn. All rights reserved.
//

import UIKit

class whenViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var passIndexPath:NSIndexPath?
    
    @IBOutlet weak var whenCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return whenGroupArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell:whenCollViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("whenCell", forIndexPath: indexPath) as! whenCollViewCell
        
        cell.whenLabel.text = whenGroupArray[indexPath.row]
        
        cell.backgroundColor = mainColor

        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        whenChoice = whenGroupArray[indexPath.row]
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue == "toConfirm" {
//            let vc: confirmViewController = segue.destinationViewController as! confirmViewController
//            vc.whatPick.text = whatChoice?.whatName
//            vc.wherePick.text = whereChoice?.whereName
//            // vc.whoPick.text = whoChoice?.groupName
//            vc.whenPick.text = whenChoice
        }
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
