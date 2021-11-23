//
//  SettingsViewController.swift
//  Kitchen Sink
//
//  Created by Roger Perales II on 11/11/21.
//

import UIKit

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
        UserDefaults.standard.set(sender.isOn, forKey: "darkmode")
        UserDefaults.standard.synchronize()
    }
    @IBAction func gluten(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "gluten")
        UserDefaults.standard.synchronize()
    }
    @IBAction func vegetarian(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "vegetarian")
        UserDefaults.standard.synchronize()
    }
    @IBAction func halal(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "halal")
        UserDefaults.standard.synchronize()
    }
    @IBAction func kosher(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "kosher")
        UserDefaults.standard.synchronize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // set background based on darkmode
        if (UserDefaults.standard.bool(forKey: "darkmode")) {
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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        darkmodeSwitch?.isOn = UserDefaults.standard.bool(forKey: "darkmode")
        glutenSwitch?.isOn = UserDefaults.standard.bool(forKey: "gluten")
        vegetarianSwitch?.isOn = UserDefaults.standard.bool(forKey: "vegetarian")
        halalSwitch?.isOn = UserDefaults.standard.bool(forKey: "halal")
        kosherSwitch?.isOn = UserDefaults.standard.bool(forKey: "kosher")
        
    }

}
