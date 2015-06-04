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

