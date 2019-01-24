//
//  ViewController.swift
//  WhatsAppClone
//
//  Created by Puspank Kumar on 17/01/19.
//  Copyright © 2019 Puspank Kumar. All rights reserved.
//

import UIKit
import ProgressHUD

class WelcomeVC: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    // MARK: IBActions
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        
        dismissKeyboard()
        
        if emailTextField.text != "" && passwordTextField.text != "" {
            
            loginUser()
            
            
        } else {
            
            ProgressHUD.showError("Email and Passwaord is missing")
        }
        
    }
    
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        
        dismissKeyboard()
        
        // email validation
        // password length validation >6
        
        if emailTextField.text != "" && passwordTextField.text != "" && repeatTextField.text != ""{
            
            if passwordTextField.text == repeatTextField.text {
                
                registerUser()
    
            } else {
                
                ProgressHUD.showError("Password doesn't match!")
            }
            
        } else {
            
            ProgressHUD.showError("All Fields are required")
        }
        
        
        
    }
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        
        dismissKeyboard()
    }
    
    
    // MARK: Helper Function
    
    // Login user Functionality
    func loginUser()  {
        
        ProgressHUD.show("Login...")
        FUser.loginUserWith(email: emailTextField.text!, password: passwordTextField.text!) { error in
            
            if error != nil {
                
                ProgressHUD.showError(error!.localizedDescription)
                return
            }
            
            // Present the app
            self.goToApp()
        }
    }
    
    
    // User registration Functionality
    func registerUser() {

        performSegue(withIdentifier: "welcomeToFinishReg", sender: self)
        cleantextFields()
        dismissKeyboard()
        
    }
    
    // Dismiss the Keyboard
    func dismissKeyboard()  {
        
        self.view.endEditing(true)
    }
    
    // Clean All textfields 
    func cleantextFields() {
        
        emailTextField.text = ""
        passwordTextField.text = ""
        repeatTextField.text = ""
    }
    
    // MARK: GoToApp
    
    func goToApp()  {
        
        ProgressHUD.dismiss()
        cleantextFields()
        dismissKeyboard()
        
        // access main Application flow...
        let mainView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainApplication") as! UITabBarController
        self.present(mainView, animated: true, completion: nil)
    }
    
    //MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "welcomeToFinishReg" {
            
            let vc = segue.destination as! FinishRegistrationVC
            vc.email = emailTextField.text!
            vc.password = passwordTextField.text!
        }
        
    }
    
}

