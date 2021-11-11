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
    }
    
    // hide/show confirm password elements depending on mode
    
    @IBAction func modeChanged(_ sender: Any) {
        if(modeToggle.selectedSegmentIndex == 0) {
            confirmPasswordLabel.isHidden = true
            confirmPasswordTextField.isHidden = true
            signInButton.setTitle("Sign in", for: UIControl.State.normal)
        }
        else if(modeToggle.selectedSegmentIndex == 1) {
            confirmPasswordLabel.isHidden = false
            confirmPasswordTextField.isHidden = false
            signInButton.setTitle("Sign up", for: UIControl.State.normal)
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
                self.statusLabel.text = "Fill all the text fields."
                return
            }
            Auth.auth().signIn(withEmail: email, password: password) { user, error in
                if let error = error, user == nil  {
                    self.statusLabel.text = "Sign in unsuccessful."
                }
                else {
                    self.statusLabel.text = "Sign in successful."
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
                return
            }
            Auth.auth().createUser(withEmail: email, password: password) { user, error in
                if(error == nil) {
                    Auth.auth().signIn(withEmail: email, password: password)
                    self.statusLabel.text = "Sign up successful."
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                }
                else {
                    self.statusLabel.text = "Sign up unsuccessful."
                    return
                }
            }
        }
    }
}
