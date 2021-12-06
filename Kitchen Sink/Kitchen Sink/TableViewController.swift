//
//  TableViewController.swift
//  Kitchen Sink
//
//  Created by Samuel Perales on 11/27/21.
//

import UIKit
import Firebase
import CoreData

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var resultType: String = ""
    let textCellIdentifier = "TextCell"
    var coreRecipes: [NSManagedObject] = []
    var displayed_recipes: [NSManagedObject] = []
    
    override func viewWillAppear(_ animated: Bool) {
        // get current user
        let user = Auth.auth().currentUser
        let email: String = user?.email ?? "none"
        
        super.viewWillAppear(animated)
        // set background based on darkmode
        if (UserDefaults.standard.bool(forKey: email + "darkmode")) {
            view.backgroundColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
            tableView.backgroundColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
        }
        else {
            view.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
            tableView.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = Auth.auth().currentUser
        let email: String = user?.email ?? "none"
        // core data setup
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CoreRecipe")
        do {
            coreRecipes = try managedContext.fetch(fetchRequest)
          } catch let error as NSError {
            print("Fetch failed.")
        }
                
        for r in coreRecipes {
            if((r.value(forKeyPath: "type") as! String).contains(resultType)) {
                var addRecipe: Bool = true
                if (UserDefaults.standard.bool(forKey: email + "gluten") == true) {
                    if((r.value(forKeyPath: "tags") as! [String]).contains("Gluten-Free") == false) {
                        addRecipe = false
                    }
                }
                if (UserDefaults.standard.bool(forKey: email + "vegetarian") == true) {
                    if((r.value(forKeyPath: "tags") as! [String]).contains("Vegetarian") == false) {
                        addRecipe = false
                    }
                }
                if (UserDefaults.standard.bool(forKey: email + "kosher") == true) {
                    if((r.value(forKeyPath: "tags") as! [String]).contains("Kosher") == false) {
                        addRecipe = false
                    }
                }
                if (addRecipe != false) {
                    displayed_recipes.append(r)
                }
            }
            else {
                for i in (r.value(forKeyPath: "ingredients") as! [String]) {
                    if i.contains(resultType) {
                        var addRecipe: Bool = true
                        if (UserDefaults.standard.bool(forKey: email + "gluten") == true) {
                            if((r.value(forKeyPath: "tags") as! [String]).contains("Gluten-Free") == false) {
                                addRecipe = false
                            }
                        }
                        if (UserDefaults.standard.bool(forKey: email + "vegetarian") == true) {
                            if((r.value(forKeyPath: "tags") as! [String]).contains("Vegetarian") == false) {
                                addRecipe = false
                            }
                        }
                        if (UserDefaults.standard.bool(forKey: email + "kosher") == true) {
                            if((r.value(forKeyPath: "tags") as! [String]).contains("Kosher") == false) {
                                addRecipe = false
                            }
                        }
                        if (addRecipe != false) {
                            displayed_recipes.append(r)
                        }
                    }
                }
            }
        }
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayed_recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath)
        let row = indexPath.row
        cell.textLabel!.numberOfLines = 5
        cell.textLabel?.text = displayed_recipes[row].value(forKey: "name") as? String
        // cell.backgroundColor = UIColor.clear
        
        // get current user
        let user = Auth.auth().currentUser
        let email:String = user?.email ?? "none"
        
        if (UserDefaults.standard.bool(forKey: email + "darkmode")) {
            cell.backgroundColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
            cell.textLabel?.textColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
        }
        else {
            cell.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
            cell.textLabel?.textColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipe",
           let destination = segue.destination as? RecipeViewController,
           let dataIndex = tableView.indexPathForSelectedRow?.row{
            destination.recipe = displayed_recipes[dataIndex]
        }
    }
}
