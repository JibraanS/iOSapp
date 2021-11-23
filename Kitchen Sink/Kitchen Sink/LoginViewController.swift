//
//  LoginViewController.swift
//  Kitchen Sink
//
//  Created by Samuel Perales on 11/8/21.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var modeToggle: UISegmentedControl!
    @IBOutlet weak var userIDLabel: UILabel!
    @IBOutlet weak var userIDTextField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordLabel: UILabel!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        
        // this isn't necessary, but it makes it look cleaner for repeated demonstration purposes because it logs out
        super.viewDidLoad()
        
        do {
            try Auth.auth().signOut()
        } catch {
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        // hide confirm password label and text field when view is loaded
        confirmPasswordLabel.isHidden = true
        confirmPasswordTextField.isHidden = true
        self.statusLabel.text = nil
        // clear text fields when user signs in or signs out
        Auth.auth().addStateDidChangeListener() {
            auth, user in
            if(user != nil) {
                self.userIDTextField.text = nil
                self.passwordTextField.text = nil
                self.confirmPasswordTextField.text = nil
            }
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
        userIDLabel.textColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
        passwordLabel.textColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
        confirmPasswordLabel.textColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
        statusLabel.textColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
    }
    
    // hide/show confirm password elements depending on mode
    
    @IBAction func modeChanged(_ sender: Any) {
        if(modeToggle.selectedSegmentIndex == 0) {
            //confirmPasswordLabel.isHidden = true
            //confirmPasswordTextField.isHidden = true
            //signInButton.setTitle("Sign in", for: UIControl.State.normal)
            UIView.animate(
                withDuration: 0.25,
                delay: 0.0,
                options: .curveEaseOut,
                animations: {
                    self.signInButton.alpha = 0.0
                    self.confirmPasswordLabel.alpha = 0.0
                    self.confirmPasswordTextField.alpha = 0.0
                },
                completion: {_ in
                    self.signInButton.setImage(UIImage(named: "login.png"), for: .normal)
                    UIView.animate(
                        withDuration: 0.25,
                        delay: 0.0,
                        options: .curveEaseIn,
                        animations: {
                            self.signInButton.alpha = 1.0
                            self.confirmPasswordLabel.isHidden = true
                            self.confirmPasswordTextField.isHidden = true
                        },
                        completion: nil
                    )
                }
            )
        }
        else if(modeToggle.selectedSegmentIndex == 1) {
            //signInButton.setTitle("Sign up", for: UIControl.State.normal)
            UIView.animate(
                withDuration: 0.25,
                delay: 0.0,
                options: .curveEaseOut,
                animations: {
                    self.signInButton.alpha = 0.0
                },
                completion: {_ in
                    self.signInButton.setImage(UIImage(named: "signup.png"), for: .normal)
                    UIView.animate(
                        withDuration: 0.25,
                        delay: 0.0,
                        options: .curveEaseIn,
                        animations: {
                            self.signInButton.alpha = 1.0
                            self.confirmPasswordLabel.alpha = 1.0
                            self.confirmPasswordTextField.alpha = 1.0
                            self.confirmPasswordLabel.isHidden = false
                            self.confirmPasswordTextField.isHidden = false
                        },
                        completion: nil
                    )
                }
            )
        }
    }
    
    @IBAction func signButtonPressed(_ sender: Any) {
        // signing in
        if(modeToggle.selectedSegmentIndex == 0) {
            guard let email = userIDTextField.text,
                  let password = passwordTextField.text,
                  email.count > 0,
                  password.count > 0
            else {
                self.statusLabel.text = "Please complete all text fields"
                return
            }
            Auth.auth().signIn(withEmail: email, password: password) { user, error in
                if let error = error, user == nil  {
                    self.statusLabel.text = "Sign in unsuccessful"
                }
                else {
                    self.statusLabel.text = "Sign in successful"
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                }
            }
        }
        // signing up
        else if(modeToggle.selectedSegmentIndex == 1) {
            guard let email = userIDTextField.text,
                  let password = passwordTextField.text,
                  let confirmPassword = confirmPasswordTextField.text,
                  email.count > 0,
                  password.count > 0,
                  confirmPassword == password
            else {
                self.statusLabel.text = "Please complete all text fields"
                return
            }
            Auth.auth().createUser(withEmail: email, password: password) { user, error in
                if(error == nil) {
                    Auth.auth().signIn(withEmail: email, password: password)
                    self.statusLabel.text = "Sign up successful"
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                }
                else {
                    self.statusLabel.text = error?.localizedDescription
                    return
                }
            }
        }
    }
}
