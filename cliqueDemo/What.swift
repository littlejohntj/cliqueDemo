//
//  What.swift
//  cliqueDemo
//
//  Created by TJ Littlejohn on 5/15/15.
//  Copyright (c) 2015 TJ Littlejohn. All rights reserved.
//

import Foundation

class What {
    
    var whatName:String?
    
    var whatTextMessage:String?
    
    var whereArray:[Where] = [Where]()

    init(name: String, text: String, whereArr: Array<Where> ){
        
        whatName = name
        
        whereArray = whereArr
        
        whatTextMessage = text
        
    }
}
