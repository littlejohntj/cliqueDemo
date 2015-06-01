//
//  CollViewCell.swift
//  cliqueDemo
//
//  Created by TJ Littlejohn on 5/15/15.
//  Copyright (c) 2015 TJ Littlejohn. All rights reserved.
//

import UIKit

class CollViewCell: UICollectionViewCell {
    
    @IBOutlet weak var labelCell: UILabel!
    
    var whatItem:What?
    var whereItem:Where?
    
    func setWhatItem(item: What) {
        whatItem = item
    }
    
    func setWhereItem(item: Where) {
        whereItem = item
    }
}
