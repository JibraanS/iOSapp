//
//  RecipeViewController.swift
//  Kitchen Sink
//
//  Created by Roger Perales II on 11/28/21.
//

import UIKit
import Firebase
import CoreData

class RecipeViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIView!
    
    @IBOutlet weak var recipeLabel: UILabel!
    @IBOutlet weak var prepTimeLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ingredientsTitleLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var directionsTitleLabel: UILabel!
    @IBOutlet weak var directionsLabel: UILabel!
    
    var recipe: NSManagedObject?
    
    override func viewWillAppear(_ animated: Bool) {

        recipeLabel.text = recipe?.value(forKeyPath: "name") as! String
        timeLabel.text = recipe?.value(forKeyPath: "time") as! String
        descriptionLabel.text = recipe?.value(forKeyPath: "desc") as! String
        
        var ingredientList = ""
        let ingredients = recipe?.value(forKeyPath: "ingredients") as! [String]
        for i in ingredients{
            ingredientList += "• " +  i + "\n"
        }
        ingredientsLabel.text = ingredientList
        
        var directionsList = ""
        let directions = recipe?.value(forKeyPath: "directions") as! [String]
        var count = 1
        for i in directions{
            directionsList += String(count) + ") " +  i + "\n\n"
            count += 1
        }
        directionsLabel.text = directionsList
        
        // get current user
        let user = Auth.auth().currentUser
        let email:String = user?.email ?? "none"
        
        super.viewWillAppear(animated)
        // set background based on darkmode
        if (UserDefaults.standard.bool(forKey: email + "darkmode")) {
            view.backgroundColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
            scrollView.backgroundColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
            recipeLabel.textColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
            prepTimeLabel.textColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
            timeLabel.textColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
            descriptionLabel.textColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
            ingredientsTitleLabel.textColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
            ingredientsLabel.textColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
            directionsTitleLabel.textColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
            directionsLabel.textColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
        }
        else {
            view.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
            scrollView.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
            recipeLabel.textColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
            prepTimeLabel.textColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
            timeLabel.textColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
            descriptionLabel.textColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
            ingredientsTitleLabel.textColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
            ingredientsLabel.textColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
            directionsTitleLabel.textColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
            directionsLabel.textColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
