//
//  SettingsViewController.swift
//  Kitchen Sink
//
//  Created by Roger Perales II on 11/11/21.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {

    @IBOutlet weak var darkmodeSwitch: UISwitch!
    @IBOutlet weak var glutenSwitch: UISwitch!
    @IBOutlet weak var vegetarianSwitch: UISwitch!
    @IBOutlet weak var halalSwitch: UISwitch!
    @IBOutlet weak var kosherSwitch: UISwitch!
    
    // Labels to change color
    @IBOutlet weak var darkmodeLabel: UILabel!
    @IBOutlet weak var dietaryLabel: UILabel!
    @IBOutlet weak var glutenLabel: UILabel!
    @IBOutlet weak var vegetarianLabel: UILabel!
    @IBOutlet weak var halalLabel: UILabel!
    @IBOutlet weak var kosherLabel: UILabel!
    
    @IBAction func darkmode(_ sender: UISwitch) {
        let user = Auth.auth().currentUser
        let email:String = user?.email ?? "none"
        if (sender.isOn == true){
            view.backgroundColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
            darkmodeLabel.textColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
            dietaryLabel.textColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
            glutenLabel.textColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
            vegetarianLabel.textColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
            halalLabel.textColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
            kosherLabel.textColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
        }
        else {
            view.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
            darkmodeLabel.textColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
            dietaryLabel.textColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
            glutenLabel.textColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
            vegetarianLabel.textColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
            halalLabel.textColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
            kosherLabel.textColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
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
    @IBAction func halal(_ sender: UISwitch) {
        let user = Auth.auth().currentUser
        let email:String = user?.email ?? "none"
        UserDefaults.standard.set(sender.isOn, forKey: email + "halal")
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
            halalLabel.textColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
            kosherLabel.textColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
        }
        else {
            view.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
            darkmodeLabel.textColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
            dietaryLabel.textColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
            glutenLabel.textColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
            vegetarianLabel.textColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
            halalLabel.textColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
            kosherLabel.textColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
        }
        
        darkmodeSwitch?.isOn = UserDefaults.standard.bool(forKey: email + "darkmode")
        glutenSwitch?.isOn = UserDefaults.standard.bool(forKey: email + "gluten")
        vegetarianSwitch?.isOn = UserDefaults.standard.bool(forKey: email + "vegetarian")
        halalSwitch?.isOn = UserDefaults.standard.bool(forKey: email + "halal")
        kosherSwitch?.isOn = UserDefaults.standard.bool(forKey: email + "kosher")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
