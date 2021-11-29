//
//  SearchViewController.swift
//  Kitchen Sink
//
//  Created by Samuel Perales on 11/27/21.
//

import UIKit
import Firebase
import FirebaseAuth
import CoreData

var recipes: [Recipe] = []
// need to figure out if this works... if not i can just scan for recipes of the same name
var recipesRead = false

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
        readFile()
    }
    
    func readFile() {
        if(recipesRead == false) {
            let fileURL = Bundle.main.path(forResource: "recipes", ofType: "txt")
            var readString = ""
            do {
                readString = try String(contentsOfFile: fileURL!, encoding: String.Encoding.utf8)
                let myStrings = readString.components(separatedBy: "\n\n")
                for dishes in myStrings {
                    let components = dishes.components(separatedBy: .newlines)
                    let recipeTags = components[4].components(separatedBy: ", ")
                    let recipeIngs = components[5].components(separatedBy: ", ")
                    let recipeDirs = components[6].components(separatedBy: ". ")
                    let recipe = Recipe(_name: components[0], _time: components[1], _desc: components[2], _type: components[3], _tags: recipeTags, _ingredients: recipeIngs, _dirs: recipeDirs)
                    recipes.append(recipe)
                    // this is ABSOLUTELY frankensteined together and i don't know if it works. we'll see!
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    let context = appDelegate.persistentContainer.viewContext
                    print("success!")
                    let newCoreRecipe = NSEntityDescription.insertNewObject(forEntityName: "CoreRecipe", into: context)
                    newCoreRecipe.setValue(recipe.name, forKey: "name")
                    newCoreRecipe.setValue(recipe.time, forKey: "time")
                    newCoreRecipe.setValue(recipe.description, forKey: "desc")
                    newCoreRecipe.setValue(recipe.tags, forKey: "tags")
                    newCoreRecipe.setValue(recipe.ingredients, forKey: "ingredients")
                    newCoreRecipe.setValue(recipe.directions, forKey: "directions")
                }
            } catch let error as NSError {
                print("Failed to read file")
                print(error)
            }
        }
        recipesRead = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let nextVC = segue.destination as? TableViewController
        if segue.identifier == "search" {
            nextVC?.resultType = searchField.text?.lowercased() ?? ""
        }
        else {
            nextVC?.resultType = segue.identifier ?? ""
        }
    }


}
