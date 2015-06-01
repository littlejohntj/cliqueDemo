//
//  whereViewController.swift
//  cliqueDemo
//
//  Created by TJ Littlejohn on 5/15/15.
//  Copyright (c) 2015 TJ Littlejohn. All rights reserved.
//

import UIKit

class whereViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var whereCollectionView: UICollectionView!
    
    var whereCollection: [Where] = [Where]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        println(whereCollection)
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return whereCollection.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:whereCollViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! whereCollViewCell
        
        cell.whereLabel.text = whereCollection[indexPath.row].whereName
        
        cell.backgroundColor = mainColor

        
        println(whereCollection[indexPath.row].whereName)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        whereChoice = whereCollection[indexPath.row]
        println(whereChoice?.whereName)
    }
    
    

    

}
