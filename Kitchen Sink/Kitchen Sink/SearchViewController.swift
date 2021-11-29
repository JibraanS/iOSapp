//
//  SearchViewController.swift
//  Kitchen Sink
//
//  Created by Samuel Perales on 11/27/21.
//

import UIKit
import Firebase
import FirebaseAuth

class Recipe {
    var name = ""
    var time = ""
    var description = ""
    var type = "" //breakfast, lunch dinner
    var tags = [""]
    var ingredients = [""]
    var directions = [""]
}

var recipes:[Recipe] = []
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
                for dishes in myStrings{
                    var recipe = Recipe()
                    let components = dishes.components(separatedBy: .newlines)
                    recipe.name = components[0]
                    recipe.time = components[1]
                    recipe.description = components[2]
                    recipe.type = components[3]
                    recipe.tags = components[4].components(separatedBy: ", ")
                    let ingredient_list = components[5].components(separatedBy: ", ")
                    recipe.ingredients = ingredient_list
                    let direction_list = components[6].components(separatedBy: ". ")
                    recipe.directions = direction_list
                    recipes.append(recipe)
                }
            } catch let error as NSError{
                print("Failed to read file")
                print(error)
            }
        }
        recipesRead = true
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
