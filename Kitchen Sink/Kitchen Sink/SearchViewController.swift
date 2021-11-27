//
//  SearchViewController.swift
//  Kitchen Sink
//
//  Created by Samuel Perales on 11/27/21.
//

import UIKit
import Firebase

class SearchViewController: UIViewController {
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var breakfastButton: UIButton!
    @IBOutlet weak var lunchButton: UIButton!
    @IBOutlet weak var dinnerButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
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
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let nextVC = segue.destination as? TableViewController
        if segue.identifier == "search" {
            nextVC?.resultType = searchField.text ?? ""
        }
        else {
            nextVC?.resultType = segue.identifier ?? ""
        }
    }


}
