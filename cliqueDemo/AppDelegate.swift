//
//  AppDelegate.swift
//  cliqueDemo
//
//  Created by TJ Littlejohn on 5/15/15.
//  Copyright (c) 2015 TJ Littlejohn. All rights reserved.
//

import UIKit
import AddressBook

var arrayOfContacts: [Contact] = [Contact]()
var contactDict = contactDictionary()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    /* Get our adress book for reference */
    
     lazy var addressBook: ABAddressBookRef = {
        var error: Unmanaged<CFError>?
        return ABAddressBookCreateWithOptions(nil,
        &error).takeRetainedValue() as ABAddressBookRef
    }()
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        /* Get permition */
        let status = ABAddressBookGetAuthorizationStatus()
        switch status{
        case .Authorized:
            println("Already Authorized")
            self.readFromAddressBook(addressBook)
        case .Denied:
            println("You are denied acess to the Address Book")
        case .NotDetermined:
            ABAddressBookRequestAccessWithCompletion(addressBook,
                {[weak self] (granted: Bool, error: CFError!) in
                    
                    if granted{
                        let strongSelf = self
                        println("acessgranted")
                        strongSelf!.readFromAddressBook(strongSelf!.addressBook)
                    } else {
                        println("Access is not granted")
                    }
                    
            })
        case .Restricted:
            println("Access is restricted")
        default:
            println("Unhandled")
        }
            
        return true
    }
        
        func readFromAddressBook(adressBook: ABAddressBookRef){
            /* Get all the people in the adress book*/
            let allPeople = ABAddressBookCopyArrayOfAllPeople(adressBook).takeRetainedValue() as NSArray
            
            var firstName:NSString?
            var lastName:NSString?
            var newPhoneNumber:NSString?
            
            for person: ABRecordRef in allPeople{
                if ABRecordCopyValue(person, kABPersonFirstNameProperty) != nil {
                    firstName = ABRecordCopyValue(person, kABPersonFirstNameProperty).takeRetainedValue() as? NSString
                }else {
                    firstName = ""
                }
                
                if ABRecordCopyValue(person, kABPersonLastNameProperty) != nil {
                    lastName = ABRecordCopyValue(person, kABPersonLastNameProperty).takeRetainedValue() as? NSString
                }else {
                    lastName = ""
                }
                /* ABMultiValueCopyArrayOfAllValues(phoneNumber) future use maybe */
                if ABRecordCopyValue(person, kABPersonPhoneProperty) != nil {
                    var phoneNumber: ABMultiValueRef = ABRecordCopyValue(person, kABPersonPhoneProperty).takeRetainedValue() as ABMultiValueRef
                    if ABMultiValueCopyValueAtIndex(phoneNumber, 0) != nil {
                    newPhoneNumber = ABMultiValueCopyValueAtIndex(phoneNumber, 0).takeRetainedValue() as? NSString
                    newPhoneNumber = newPhoneNumber!.stringByReplacingOccurrencesOfString(" ", withString: "")
                    newPhoneNumber = newPhoneNumber!.stringByReplacingOccurrencesOfString("-", withString: "")
                    newPhoneNumber = newPhoneNumber!.stringByReplacingOccurrencesOfString("(", withString: "")
                    newPhoneNumber = newPhoneNumber!.stringByReplacingOccurrencesOfString(")", withString: "")
                    }
                } else {
                    newPhoneNumber = "5555555555"
                }
                var newContact = Contact(fn: firstName!, ln: lastName!, pn: newPhoneNumber!)
                arrayOfContacts.append(newContact)
                contactDict.addContactToDictionary(newContact)
            }
        }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

