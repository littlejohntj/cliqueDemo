//
//  operatorOverloads.swift
//  cliqueDemo
//
//  Created by TJ Littlejohn on 5/31/15.
//  Copyright (c) 2015 TJ Littlejohn. All rights reserved.
//

import Foundation

func > (left: Contact, right: Contact) -> Bool {
    if ( left.lastName != "" && right.lastName != "" ) {
        if ( left.firstName > right.firstName ){
            return true
        } else {
            return false
        }
    } else if ( left.lastName == "" && right.lastName != "" && left.firstName != "") {
        if ( left.firstName > right.lastName ) {
            return true
        } else {
            return false
        }
    } else if ( left.lastName != "" && right.lastName == "" && right.firstName != "") {
        if ( left.lastName > right.firstName ){
            return true
        } else {
            return false
        }
    } else if ( left.lastName == "" && right.lastName == "" && left.firstName != "" && right.firstName != ""){
        if left.firstName > right.firstName {
            return true
        } else {
            return false
        }
    } else {
        return false
    }
}

func < (left: Contact, right: Contact) -> Bool {
    if ( left.lastName != "" && right.lastName != "" ) {
        if ( left.firstName < right.firstName ){
            return true
        } else {
            return false
        }
    } else if ( left.lastName == "" && right.lastName != "" && left.firstName != "") {
        if ( left.firstName < right.lastName ) {
            return true
        } else {
            return false
        }
    } else if ( left.lastName != "" && right.lastName == "" && right.firstName != "") {
        if ( left.lastName < right.firstName ){
            return true
        } else {
            return false
        }
    } else if ( left.lastName == "" && right.lastName == "" && left.firstName != "" && right.firstName != ""){
        if left.firstName < right.firstName {
            return true
        } else {
            return false
        }
    } else {
        return false
    }
}

extension String {
    
    subscript (i: Int) -> Character {
        return self[advance(self.startIndex, i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        return substringWithRange(Range(start: advance(startIndex, r.startIndex), end: advance(startIndex, r.endIndex)))
    }
    
    func firstCharacterUpperCase() -> String {
        let lowercaseString = self.lowercaseString
        return lowercaseString.stringByReplacingCharactersInRange(lowercaseString.startIndex...lowercaseString.startIndex, withString: String(lowercaseString[lowercaseString.startIndex]).uppercaseString)
        }
    
}


