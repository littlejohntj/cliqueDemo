//
//  contactDictionary.swift
//  cliqueDemo
//
//  Created by TJ Littlejohn on 5/31/15.
//  Copyright (c) 2015 TJ Littlejohn. All rights reserved.
//



import Foundation

class contactDictionary {
    
    var dict = Dictionary< String , Array<Contact> >()
    
    var aDictionary:[Contact] = [Contact]()
    var bDictionary:[Contact] = [Contact]()
    var cDictionary:[Contact] = [Contact]()
    var dDictionary:[Contact] = [Contact]()
    var eDictionary:[Contact] = [Contact]()
    var fDictionary:[Contact] = [Contact]()
    var gDictionary:[Contact] = [Contact]()
    var hDictionary:[Contact] = [Contact]()
    var iDictionary:[Contact] = [Contact]()
    var jDictionary:[Contact] = [Contact]()
    var kDictionary:[Contact] = [Contact]()
    var lDictionary:[Contact] = [Contact]()
    var mDictionary:[Contact] = [Contact]()
    var nDictionary:[Contact] = [Contact]()
    var oDictionary:[Contact] = [Contact]()
    var pDictionary:[Contact] = [Contact]()
    var qDictionary:[Contact] = [Contact]()
    var rDictionary:[Contact] = [Contact]()
    var sDictionary:[Contact] = [Contact]()
    var tDictionary:[Contact] = [Contact]()
    var uDictionary:[Contact] = [Contact]()
    var vDictionary:[Contact] = [Contact]()
    var wDictionary:[Contact] = [Contact]()
    var xDictionary:[Contact] = [Contact]()
    var yDictionary:[Contact] = [Contact]()
    var zDictionary:[Contact] = [Contact]()
    var numDictionary:[Contact] = [Contact]()
    
    init() {
        dict["A"] = aDictionary
        dict["B"] = bDictionary
        dict["C"] = cDictionary
        dict["D"] = dDictionary
        dict["E"] = eDictionary
        dict["F"] = fDictionary
        dict["G"] = gDictionary
        dict["H"] = hDictionary
        dict["I"] = iDictionary
        dict["J"] = jDictionary
        dict["K"] = kDictionary
        dict["L"] = lDictionary
        dict["M"] = mDictionary
        dict["N"] = nDictionary
        dict["O"] = oDictionary
        dict["P"] = pDictionary
        dict["Q"] = qDictionary
        dict["R"] = rDictionary
        dict["S"] = sDictionary
        dict["T"] = tDictionary
        dict["U"] = uDictionary
        dict["V"] = vDictionary
        dict["W"] = wDictionary
        dict["X"] = xDictionary
        dict["Y"] = yDictionary
        dict["Z"] = zDictionary
        dict["#"] = numDictionary
    }
    
    func addContactToDictionary(contact: Contact) {
        
        var nameSection:Character = " "
        if contact.lastName != "" {
            nameSection = first(contact.lastName!)!
        }else if contact.firstName != "" {
            nameSection = first(contact.firstName!)!
        }
        
        switch nameSection {
        case "A": aDictionary.append(contact)
            self.dict.updateValue(aDictionary, forKey: "A")
        case "B": bDictionary.append(contact)
            self.dict.updateValue(bDictionary, forKey: "B")
        case "C": cDictionary.append(contact)
            self.dict.updateValue(cDictionary, forKey: "C")
        case "D": dDictionary.append(contact)
            self.dict.updateValue(dDictionary, forKey: "D")
        case "E": eDictionary.append(contact)
            self.dict.updateValue(eDictionary, forKey: "E")
        case "F": fDictionary.append(contact)
            self.dict.updateValue(fDictionary, forKey: "F")
        case "G": gDictionary.append(contact)
            self.dict.updateValue(gDictionary, forKey: "G")
        case "H": hDictionary.append(contact)
            self.dict.updateValue(hDictionary, forKey: "H")
        case "I": iDictionary.append(contact)
            self.dict.updateValue(iDictionary, forKey: "I")
        case "J": jDictionary.append(contact)
            self.dict.updateValue(jDictionary, forKey: "J")
        case "K": kDictionary.append(contact)
            self.dict.updateValue(kDictionary, forKey: "K")
        case "L": lDictionary.append(contact)
            self.dict.updateValue(lDictionary, forKey: "L")
        case "M": mDictionary.append(contact)
            self.dict.updateValue(mDictionary, forKey: "M")
        case "N": nDictionary.append(contact)
            self.dict.updateValue(nDictionary, forKey: "N")
        case "O": oDictionary.append(contact)
            self.dict.updateValue(oDictionary, forKey: "O")
        case "P": pDictionary.append(contact)
            self.dict.updateValue(pDictionary, forKey: "P")
        case "Q": qDictionary.append(contact)
            self.dict.updateValue(qDictionary, forKey: "Q")
        case "R": rDictionary.append(contact)
            self.dict.updateValue(rDictionary, forKey: "R")
        case "S": sDictionary.append(contact)
            self.dict.updateValue(sDictionary, forKey: "S")
        case "T": tDictionary.append(contact)
            self.dict.updateValue(tDictionary, forKey: "T")
        case "U": uDictionary.append(contact)
            self.dict.updateValue(uDictionary, forKey: "U")
        case "V": vDictionary.append(contact)
            self.dict.updateValue(vDictionary, forKey: "V")
        case "W": wDictionary.append(contact)
            self.dict.updateValue(wDictionary, forKey: "W")
        case "X": xDictionary.append(contact)
            self.dict.updateValue(xDictionary, forKey: "X")
        case "Y": yDictionary.append(contact)
            self.dict.updateValue(yDictionary, forKey: "Y")
        case "Z": zDictionary.append(contact)
            self.dict.updateValue(zDictionary, forKey: "Z")
        default: numDictionary.append(contact)
            self.dict.updateValue(numDictionary, forKey: "#")
        }
        
        
    }
}


