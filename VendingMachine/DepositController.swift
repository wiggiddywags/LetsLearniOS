//
//  DepositController.swift
//  VendingMachine
//
//  Created by Josh Waggoner on 5/27/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit

class DepositController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func dismiss() {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
