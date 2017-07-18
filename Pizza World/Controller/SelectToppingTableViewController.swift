//
//  SelectToppingTableViewController.swift
//  Pizza World
//
//  Created by Adeel Miraj on 25/04/2016.
//  Copyright © 2016 AM Co. All rights reserved.
//

import UIKit

enum ToppingCategory {
    case None
    case Cheese
    case Meat
    case Sauses
    case Veggies
}

class SelectToppingTableViewController: UITableViewController {
    
    var category: ToppingCategory = .None
    
    let cheese:  NSArray = ["American cheese", "provolone", "Shredded Parmesan", "sliced mozzarella", "swiss"]
    let meat:    NSArray = ["Anchovies", "bacon", "beef", "canadian bacon", "grilled chicken", "italian sausage", "PEPPERONI", "turkey"]
    let sauses:  NSArray = ["BasilPesto", "bbq", "chipotle ranch", "garlic", "honey mustard", "hot sause", "ranch", "yellow mustard"]
    let veggies: NSArray = ["banana peppers", "black olives", "green olives", "green peppers", "jalapeno peppers", "Mushrooms", "onions", "red peppers", "roma-tomato"]
    var dataSource: NSArray = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        /*
        switch category {
            case .Cheese:
                dataSource = cheese
                
            case .Meat:
                dataSource = meat
                
            case .Sauses:
                dataSource = sauses
                
            case .Veggies:
                dataSource = veggies
            
            default: break
        }
        
        self.navigationItem.leftBarButtonItem  = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: "dismiss")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "done")
*/
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "done")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismiss () {
        switch category {
        case .Cheese:
            dataSource = cheese
            
        case .Meat:
            dataSource = meat
            
        case .Sauses:
            dataSource = sauses
            
        case .Veggies:
            dataSource = veggies
            
        default: break
        }
        
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    
    func done () {
        self.performSegueWithIdentifier("ownPizza.checkOut", sender: nil)
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        return 4
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        switch section {
            case 0:
                return cheese.count
            
            case 1:
                return meat.count
            
            case 2:
                return sauses.count
            
            case 3:
                return veggies.count
            
            default: return 0
        }
        
//        return dataSource.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        // Configure the cell...
        var name: String = ""
        
        switch indexPath.section {
            case 0:
                name = cheese[indexPath.row] as! String
                let item: Item = Item.init(name: name, price: 0.5)
                
                if PizzaOrder.itemAlreadyExists(item, inTopping: PizzaOrder.sharedOrder.cheeseTopping) {
                    cell.accessoryType = .Checkmark
                }
                else {
                    cell.accessoryType = .None
                }
                
            case 1:
                name = meat[indexPath.row] as! String
                let item: Item = Item.init(name: name, price: 0.5)
                
                if PizzaOrder.itemAlreadyExists(item, inTopping: PizzaOrder.sharedOrder.meatTopping) {
                    cell.accessoryType = .Checkmark
                }
                else {
                    cell.accessoryType = .None
                }
            
            case 2:
                name = sauses[indexPath.row] as! String
                let item: Item = Item.init(name: name, price: 0.5)
                
                if PizzaOrder.itemAlreadyExists(item, inTopping: PizzaOrder.sharedOrder.sauses) {
                    cell.accessoryType = .Checkmark
                }
                else {
                    cell.accessoryType = .None
                }
            
            case 3:
                name = veggies[indexPath.row] as! String
                let item: Item = Item.init(name: name, price: 0.5)
                
                if PizzaOrder.itemAlreadyExists(item, inTopping: PizzaOrder.sharedOrder.veggisTopping) {
                    cell.accessoryType = .Checkmark
                }
                else {
                    cell.accessoryType = .None
                }
            
            default: break
                
        }
        
        cell.textLabel?.text = name
        cell.imageView?.image = UIImage(named: name)
        cell.detailTextLabel?.text = "$0.5"

        /*
        switch category {
        case .Cheese:
            if PizzaOrder.sharedOrder.cheeseTopping.name == name {
                cell.accessoryType = .Checkmark
            }
            else {
                cell.accessoryType = .None
            }
            
        case .Meat:
            if PizzaOrder.sharedOrder.meatTopping.name == name {
                cell.accessoryType = .Checkmark
            }
            else {
                cell.accessoryType = .None
            }
            
        case .Sauses:
            if PizzaOrder.sharedOrder.sauseTopping.name == name {
                cell.accessoryType = .Checkmark
            }
            else {
                cell.accessoryType = .None
            }
            
        case .Veggies:
            if PizzaOrder.sharedOrder.veggiesTopping.name == name {
                cell.accessoryType = .Checkmark
            }
            else {
                cell.accessoryType = .None
            }
            
        default: break
            
        }
*/

        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
            case 0:
                return "Cheese"
                
            case 1:
                return "Meat"
                
            case 2:
                return "Sauce"
                
            case 3:
                return "Veggies"
                
            default: return ""
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var toppingName: String// = dataSource[indexPath.row] as! String
        
        switch indexPath.section {
        case 0:
            toppingName = cheese[indexPath.row] as! String
            let item: Item = Item.init(name: toppingName, price: 0.5)
            
            if PizzaOrder.itemAlreadyExists(item, inTopping: PizzaOrder.sharedOrder.cheeseTopping) {
                PizzaOrder.sharedOrder.cheeseTopping.removeObject(item)
            }
            else {
                PizzaOrder.sharedOrder.cheeseTopping.append(item)
            }
            
        case 1:
            toppingName = meat[indexPath.row] as! String
            let item: Item = Item.init(name: toppingName, price: 0.5)
            
            if PizzaOrder.itemAlreadyExists(item, inTopping: PizzaOrder.sharedOrder.meatTopping) {
                PizzaOrder.sharedOrder.meatTopping.removeObject(item)
            }
            else {
                PizzaOrder.sharedOrder.meatTopping.append(item)
            }
        case 2:
            toppingName = sauses[indexPath.row] as! String
            let item: Item = Item.init(name: toppingName, price: 0.5)
            
            if PizzaOrder.itemAlreadyExists(item, inTopping: PizzaOrder.sharedOrder.sauses) {
                PizzaOrder.sharedOrder.sauses.removeObject(item)
            }
            else {
                PizzaOrder.sharedOrder.sauses.append(item)
            }
            
        case 3:
            toppingName = veggies[indexPath.row] as! String
            let item: Item = Item.init(name: toppingName, price: 0.5)
            
            if PizzaOrder.itemAlreadyExists(item, inTopping: PizzaOrder.sharedOrder.veggisTopping) {
                PizzaOrder.sharedOrder.veggisTopping.removeObject(item)
            }
            else {
                PizzaOrder.sharedOrder.veggisTopping.append(item)
            }
            
        default: break
        }
        
        /*
        switch category {
            case .Cheese:
                PizzaOrder.sharedOrder.cheeseTopping.name = toppingName
                PizzaOrder.sharedOrder.cheeseTopping.price = 0.5
                
            case .Meat:
                PizzaOrder.sharedOrder.meatTopping.name = toppingName
                PizzaOrder.sharedOrder.meatTopping.price = 0.5
                
            case .Sauses:
                PizzaOrder.sharedOrder.sauseTopping.name = toppingName
                PizzaOrder.sharedOrder.sauseTopping.price = 0.5
                
            case .Veggies:
                PizzaOrder.sharedOrder.veggiesTopping.name = toppingName
                PizzaOrder.sharedOrder.veggiesTopping.price = 0.5
                
            default: break
        }
*/
        PizzaOrder.sharedOrder.selectedPizza.name=""
        tableView.reloadData()
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
