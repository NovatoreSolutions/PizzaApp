//
//  CheckOutViewController.swift
//  Pizza World
//
//  Created by Adeel Miraj on 25/04/2016.
//  Copyright © 2016 AM Co. All rights reserved.
//

import UIKit

class CheckOutViewController: UIViewController {

    @IBOutlet weak var billLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let amount = PizzaOrder.sharedOrder.totalPayable()
        billLabel.text = "$\(amount)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func placeOrder(sender: AnyObject) {
        PizzaOrder.sharedOrder.resetOrder()
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
