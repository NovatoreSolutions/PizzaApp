//
//  PizzaTableViewController.swift
//  Pizza World
//
//  Created by Adeel Miraj on 25/04/2016.
//  Copyright © 2016 AM Co. All rights reserved.
//

import UIKit

class PizzaTableViewController: UITableViewController {
    
    let pizzaNames:  NSArray = ["Chicken Fajita", "Chicken Supreme", "Classic Euro"]
    let pizzaPrices: NSArray = [4.5, 5, 4]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        
//        if PizzaOrder.sharedOrder.selectedPizza.name == "" {
//            self.navigationItem.rightBarButtonItem?.enabled = false
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pizzaNames.count + 1
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        
        if indexPath.row == pizzaNames.count {
            cell = tableView.dequeueReusableCellWithIdentifier("buttonCell", forIndexPath: indexPath)
            return cell
        }
        
        cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        // Configure the cell...
        let pizzaName = pizzaNames[indexPath.row] as? String
        cell.textLabel?.text = pizzaName
        let pizzaPrice: String = ((pizzaPrices[indexPath.row] as? NSNumber)?.stringValue)!
        cell.detailTextLabel?.text = "$\(pizzaPrice)"
        cell.imageView?.image = UIImage(named: pizzaName!)
        cell.imageView?.layer.cornerRadius = (cell.imageView?.bounds.size.height)!/2
        cell.imageView?.layer.masksToBounds = true
        
        if PizzaOrder.sharedOrder.selectedPizza.name == pizzaName {
            cell.accessoryType = .Checkmark
        }
        else {
            cell.accessoryType = .None
        }

        return cell
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
    
    // MARK: - Table View Delegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        PizzaOrder.sharedOrder.selectedPizza.name  = (pizzaNames[indexPath.row] as? String)!
        PizzaOrder.sharedOrder.selectedPizza.price = (pizzaPrices[indexPath.row] as? NSNumber)!.doubleValue
        
        tableView.reloadData()
        // self.navigationItem.rightBarButtonItem?.enabled = true
        
        self.performSegueWithIdentifier("pizza.checkOut", sender: indexPath)
    }

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

    // MARK: - Navigation
    
    @IBAction func addTopping(sender: UIBarButtonItem) {
        
        let toppingsVC = self.storyboard?.instantiateViewControllerWithIdentifier("SelectToppingTableViewController") as! SelectToppingTableViewController
        let navigationController = UINavigationController(rootViewController: toppingsVC)
        let actionSheet = UIAlertController(title: "Extra Topping", message: "Which extra topping do you want to add?", preferredStyle: .ActionSheet)
        
        
        let cheese = UIAlertAction(title: "Cheese", style: .Default) { (UIAlertAction) -> Void in
            toppingsVC.category = .Cheese
            
            self.presentViewController(navigationController, animated: true, completion: { () -> Void in
                
            })
        }
        actionSheet.addAction(cheese)
        
        let meat = UIAlertAction(title: "Meat", style: .Default) { (UIAlertAction) -> Void in
            toppingsVC.category = .Meat
            
            self.presentViewController(navigationController, animated: true, completion: { () -> Void in
                
            })
        }
        actionSheet.addAction(meat)
        
        let sause = UIAlertAction(title: "Sauces", style: .Default) { (UIAlertAction) -> Void in
            toppingsVC.category = .Sauses
            
            self.presentViewController(navigationController, animated: true, completion: { () -> Void in
                
            })
        }
        actionSheet.addAction(sause)
        
        let veggies = UIAlertAction(title: "Veggies", style: .Default) { (UIAlertAction) -> Void in
            toppingsVC.category = .Veggies
            
            self.presentViewController(navigationController, animated: true, completion: { () -> Void in
                
            })
        }
        actionSheet.addAction(veggies)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (UIAlertAction) -> Void in
            
        }
        actionSheet.addAction(cancelAction)
        
        self.presentViewController(actionSheet, animated: true, completion: nil)
    }
    
    @IBAction func buildOwnPizza(sender: UIButton) {
        
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "pizza.ownPizza" {
//            let destination = segue.destinationViewController as! CheckOutViewController
            PizzaOrder.sharedOrder.selectedPizza.name  = "Custom Pizza"
            PizzaOrder.sharedOrder.selectedPizza.price = 5
            self.tableView.reloadData()
        }
    }

}
