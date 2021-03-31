//
//  WelcomeViewController.swift
//  LogInApp
//
//  Created by Roman Kozlov on 31.03.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "Welcome, \(userName ?? "Undefained")!"
    }
}
