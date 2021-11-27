//
//  SearchViewController.swift
//  Kitchen Sink
//
//  Created by Samuel Perales on 11/24/21.
//

import UIKit
import Firebase

class Recipe {
    var name = ""
    var description = ""
    var type = "breakfast" //breakfast, lunch, dinner
    var ingredients = [""]
    var directions = [""]
}

class SearchViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        print("HERE")
        
        // get current user
        let user = Auth.auth().currentUser
        let email:String = user?.email ?? "none"
        
        super.viewWillAppear(animated)
        // set background based on darkmode
        if (UserDefaults.standard.bool(forKey: email + "darkmode")) {
            view.backgroundColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
        }
        else {
            view.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
        }
    }
    
    override func viewDidLoad() {
        print("HERE2")
        super.viewDidLoad()

    }

}
