//
//  Contacts.swift
//  cliqueDemo
//
//  Created by TJ Littlejohn on 5/19/15.
//  Copyright (c) 2015 TJ Littlejohn. All rights reserved.
//

import Foundation

class Contact {
    
    var firstName:String?
    var lastName:String?
    var phoneNumber:String?
    
    init(fn: NSString, ln: NSString, pn: NSString){
        firstName = fn as String
        lastName = ln as String
        phoneNumber = pn as String
    }
    
    
    
}