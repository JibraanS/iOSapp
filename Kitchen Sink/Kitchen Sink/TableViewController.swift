//
//  TableViewController.swift
//  Kitchen Sink
//
//  Created by Samuel Perales on 11/27/21.
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

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    var resultType: String = ""
    let textCellIdentifier = "TextCell"
    
    public var recipes:[Recipe] = []
    
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath)
        let row = indexPath.row
        cell.textLabel!.numberOfLines = 5
        cell.textLabel?.text = "Recipe"
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print(resultType)
    }
    
}
