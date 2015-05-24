//
//  ViewController.swift
//  Current Location
//
//  Created by Icaro Barreira Lavrador on 24/05/15.
//  Copyright (c) 2015 Icaro Barreira Lavrador. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logs: UITextView!
    
    
    let locationHelper = LocationHelper()

    @IBAction func updateOnce(sender: UIBarButtonItem) {
    }
    @IBAction func stopUpdate(sender: UIBarButtonItem) {
    }
    @IBAction func startUpdate(sender: UIBarButtonItem) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationHelper.start()
        
    }
}

