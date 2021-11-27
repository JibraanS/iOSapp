//
//  SettingsViewController.swift
//  Kitchen Sink
//
//  Created by Samuel Perales on 11/11/21.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {

    @IBOutlet weak var darkmodeSwitch: UISwitch!
    @IBOutlet weak var glutenSwitch: UISwitch!
    @IBOutlet weak var vegetarianSwitch: UISwitch!
    @IBOutlet weak var kosherSwitch: UISwitch!
    
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBOutlet weak var nameField: UITextField!
    
    // Labels to change color
    @IBOutlet weak var darkmodeLabel: UILabel!
    @IBOutlet weak var dietaryLabel: UILabel!
    @IBOutlet weak var glutenLabel: UILabel!
    @IBOutlet weak var vegetarianLabel: UILabel!
    @IBOutlet weak var kosherLabel: UILabel!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBAction func darkmode(_ sender: UISwitch) {
        let user = Auth.auth().currentUser
        let email:String = user?.email ?? "none"
        if (sender.isOn == true){
            view.backgroundColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
            darkmodeLabel.textColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
            dietaryLabel.textColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
            glutenLabel.textColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
            vegetarianLabel.textColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
            kosherLabel.textColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
            accountLabel.textColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
            nameLabel.textColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
        }
        else {
            view.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
            darkmodeLabel.textColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
            dietaryLabel.textColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
            glutenLabel.textColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
            vegetarianLabel.textColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
            kosherLabel.textColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
            accountLabel.textColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
            nameLabel.textColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
        }
        UserDefaults.standard.set(sender.isOn, forKey: email + "darkmode")
        UserDefaults.standard.synchronize()
    }
    @IBAction func gluten(_ sender: UISwitch) {
        let user = Auth.auth().currentUser
        let email:String = user?.email ?? "none"
        UserDefaults.standard.set(sender.isOn, forKey: email + "gluten")
        UserDefaults.standard.synchronize()
    }
    @IBAction func vegetarian(_ sender: UISwitch) {
        let user = Auth.auth().currentUser
        let email:String = user?.email ?? "none"
        UserDefaults.standard.set(sender.isOn, forKey: email + "vegetarian")
        UserDefaults.standard.synchronize()
    }
    @IBAction func kosher(_ sender: UISwitch) {
        let user = Auth.auth().currentUser
        let email:String = user?.email ?? "none"
        UserDefaults.standard.set(sender.isOn, forKey: email + "kosher")
        UserDefaults.standard.synchronize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // get current user
        let user = Auth.auth().currentUser
        let email:String = user?.email ?? "none"
        
        // set background based on darkmode
        if (UserDefaults.standard.bool(forKey: email + "darkmode")) {
            view.backgroundColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
            darkmodeLabel.textColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
            dietaryLabel.textColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
            glutenLabel.textColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
            vegetarianLabel.textColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
            kosherLabel.textColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
            accountLabel.textColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
            nameLabel.textColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
        }
        else {
            view.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
            darkmodeLabel.textColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
            dietaryLabel.textColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
            glutenLabel.textColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
            vegetarianLabel.textColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
            kosherLabel.textColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
            accountLabel.textColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
            nameLabel.textColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
        }
        
        darkmodeSwitch?.isOn = UserDefaults.standard.bool(forKey: email + "darkmode")
        glutenSwitch?.isOn = UserDefaults.standard.bool(forKey: email + "gluten")
        vegetarianSwitch?.isOn = UserDefaults.standard.bool(forKey: email + "vegetarian")
        kosherSwitch?.isOn = UserDefaults.standard.bool(forKey: email + "kosher")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func deleteAccount(_ sender: Any) {
        var confirmDelete = false
        let controller = UIAlertController(
            title: "Delete Account",
            message: "Are you sure you want to delete your account?",
            preferredStyle: .alert)
        controller.addAction(UIAlertAction(
                                title: "Cancel",
                                style: .cancel,
                                handler: nil))
        controller.addAction(UIAlertAction(
                                title: "Delete",
                                style: .destructive,
                                handler: { _ in
                                    let user = Auth.auth().currentUser
                                    let email:String = user?.email ?? "none"
                                    let defaults = UserDefaults.standard
                                    defaults.removeObject(forKey: email + "darkmode")
                                    defaults.removeObject(forKey: email + "gluten")
                                    defaults.removeObject(forKey: email + "vegetarian")
                                    defaults.removeObject(forKey: email + "kosher")
                                    user?.delete { error in
                                        if let error = error {
                                            print(error)
                                        }
                                        else {
                                            confirmDelete = true
                                            self.performSegue(withIdentifier: "delete", sender: nil)
                                        }
                                    }
                                }))
        present(controller, animated: true, completion: nil)
        print(confirmDelete)
    }
    
}
