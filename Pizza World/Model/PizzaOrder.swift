//
//  PizzaOrder.swift
//  Pizza World
//
//  Created by Adeel Miraj on 25/04/2016.
//  Copyright © 2016 AM Co. All rights reserved.
//

import UIKit

struct Item {
    var name:  String
    var price: Double
}

extension Item: Equatable {}

func ==(lhs: Item, rhs: Item) -> Bool {
    let areEqual = lhs.name == rhs.name && lhs.price == rhs.price
    
    return areEqual
}

class PizzaOrder: NSObject {
    
    var cheeseTopping = [Item]()
    var meatTopping   = [Item]()
    var sauses        = [Item]()
    var veggisTopping = [Item]()
    
    var selectedPizza: Item = Item.init(name: "", price: 0)
    
//    var cheeseTopping: Item = Item.init(name: "", price: 0)
//    var meatTopping: Item = Item.init(name: "", price: 0)
//    var sauseTopping: Item = Item.init(name: "", price: 0)
//    var veggiesTopping: Item = Item.init(name: "", price: 0)
//    var selectedPizza: Item = Item.init(name: "", price: 0)
    
    class var sharedOrder: PizzaOrder {
        struct SharedInstance {
            static var onceToken:    dispatch_once_t = 0
            static var orderInstace: PizzaOrder? = nil
        }
        
        dispatch_once(&SharedInstance.onceToken) { () -> Void in
            SharedInstance.orderInstace = PizzaOrder()
        }
        
        return SharedInstance.orderInstace!
    }
    
    class func itemAlreadyExists(anItem: Item, inTopping topping: [Item]) -> Bool {
        
        for item in topping {
            
            if item.name == anItem.name {
                return true
            }
        }
        
        return false
    }
    
    func totalPayable () -> Double {
        
        var total: Double = 0
        
        total += PizzaOrder.sharedOrder.selectedPizza.price
        
        if PizzaOrder.sharedOrder.selectedPizza.name == "Custom Pizza" {
            return total;
        }
        
        total += totalForTopping(cheeseTopping)
        total += totalForTopping(meatTopping)
        total += totalForTopping(sauses)
        total += totalForTopping(veggisTopping)
        
//        total += PizzaOrder.sharedOrder.cheeseTopping.price
//        total += PizzaOrder.sharedOrder.meatTopping.price
//        total += PizzaOrder.sharedOrder.sauseTopping.price
//        total += PizzaOrder.sharedOrder.veggiesTopping.price
        
        return total
    }
    
    func totalForTopping (topping: [Item]) -> Double {
        
        var total: Double = 0
        
        for item in topping {
           total += item.price
        }
        
        return total
    }
    
    func resetOrder () {
        PizzaOrder.sharedOrder.selectedPizza = Item.init(name: "", price: 0)
        PizzaOrder.sharedOrder.cheeseTopping = []
        PizzaOrder.sharedOrder.meatTopping   = []
        PizzaOrder.sharedOrder.sauses        = []
        PizzaOrder.sharedOrder.veggisTopping = []
    }
}


extension Array where Element: Equatable {
    
    mutating func removeObject(object: Element) {
        let index = self.indexOf(object)
        
        if (index != nil) {
            self.removeAtIndex(index!)
        }
    }
}
