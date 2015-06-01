//
//  whoGroup.swift
//  cliqueDemo
//
//  Created by TJ Littlejohn on 5/20/15.
//  Copyright (c) 2015 TJ Littlejohn. All rights reserved.
//

import Foundation

class whoGroup {
    var groupName:String?
    var setOfGroupMembersNumbers = Set<String>()
    var hasUserAddedMembers:Bool = false
    
    
    init(name: String){
        groupName = name
    }
    
}