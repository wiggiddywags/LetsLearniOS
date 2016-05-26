//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by Josh Waggoner on 5/19/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import Foundation


//All the code related to the vending machine model

//Protocols 

//what a VenndingMachine could be
protocol VendingMachineType {
    var selection : [VendingSelection] { get }
    var inventory : [VendingSelection : ItemType] { get set }
    var amountDeposited : Double { get set }
    
    init(inventory : [VendingSelection: ItemType])
    func vend(selection: VendingSelection, quantity: Double) throws
    func deposit(amount: Double)
}

protocol ItemType {
    var price : Double { get }
    var quantity : Double { get set }
}

// error types

enum InventoryError: ErrorType {
    case InvalidResource
    case ConversionError
    case InvalidKey
}

// Helper Classes

class PlistConverter {
    class func dictionaryFromFile(resource: String, ofType type:
        String) throws -> [String : AnyObject] { //of any type that is a class
        guard let path =
            NSBundle.mainBundle().pathForResource(resource, ofType:
                type) else {
                throw InventoryError.InvalidResource
        }
        
        guard let dictionary = NSDictionary(contentsOfFile: path),
        let castDictionary = dictionary as? [String : AnyObject] else {
            throw InventoryError.ConversionError
        }
        
        return castDictionary
    }
}

class InventoryUnarchiver {
    class func VendingInventoryFromDictionary(dictionary: [String :
        AnyObject]) throws -> [VendingSelection : ItemType] {
        
        var inventory : [VendingSelection : ItemType] =  [:]
        for (key, value) in dictionary {
            if let itemDict = value as? [String : Double],
            let price = itemDict["price"], let quantity = itemDict["quantity"]{ //optional unwrap
                let item = VendingItem(price: price, quantity: quantity)
                
                guard let key = VendingSelection(rawValue: key) else {
                    throw InventoryError.InvalidKey
                }
                
                inventory.updateValue(item, forKey: key)

                
            }
            
        }
        
        return inventory
    }
}

// Concrete Types

struct VendingItem: ItemType {
    let price : Double
    var quantity : Double
    
}

enum VendingSelection: String {
    case Soda
    case DietSoda
    case Chips
    case Cookie
    case Sandwich
    case Wrap
    case CandyBar
    case PopTart
    case Water
    case FruitJuice
    case SportsDrink
    case Gum
}

class VendingMachine : VendingMachineType {
    var selection: [VendingSelection] = [.Soda, .DietSoda, .Chips, .Cookie, .Sandwich, .Wrap, .CandyBar, .PopTart, .Water, .FruitJuice, .SportsDrink, .Gum]
    var inventory: [VendingSelection : ItemType]
    var amountDeposited: Double = 10.0
    
    required init(inventory: [VendingSelection : ItemType]) {
        self.inventory = inventory
    }
    
    func vend(selection: VendingSelection, quantity: Double) throws {
        // add code
    }
    
    func deposit(amount: Double) {
        // add code
    }
}