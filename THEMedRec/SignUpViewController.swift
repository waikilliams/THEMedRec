//
//  SignUpViewController.swift
//  THEMedRec
//
//  Created by Williams, Kai on 7/6/19.
//  Copyright © 2019 Williams, Kai. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import ProgressHUD

class SignUpViewController: UIViewController {

    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var signUpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTF.backgroundColor = UIColor.clear
        emailTF.tintColor = UIColor.white
        emailTF.textColor = UIColor.white
        emailTF.attributedPlaceholder = NSAttributedString(string: emailTF.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: UIColor(white: 1.0, alpha: 0.6) ])
        let bottomLayerEmail = CALayer()
        bottomLayerEmail.frame = CGRect(x: 0, y: 29, width: 1000, height: 0.5)
        bottomLayerEmail.backgroundColor = UIColor(displayP3Red: 50/255, green: 50/255, blue: 50/255, alpha: 1).cgColor
        emailTF.layer.addSublayer(bottomLayerEmail)
        
        passwordTF.backgroundColor = UIColor.clear
        passwordTF.tintColor = UIColor.white
        passwordTF.textColor = UIColor.white
        passwordTF.attributedPlaceholder = NSAttributedString(string: passwordTF.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: UIColor(white: 1.0, alpha: 0.6) ])
        let bottomLayerPassword = CALayer()
        bottomLayerPassword.frame = CGRect(x: 0, y: 29, width: 1000, height: 0.5)
        bottomLayerPassword.backgroundColor = UIColor(displayP3Red: 50/255, green: 50/255, blue: 50/255, alpha: 1).cgColor
        passwordTF.layer.addSublayer(bottomLayerPassword)
        
        usernameTF.backgroundColor = UIColor.clear
        usernameTF.tintColor = UIColor.white
        usernameTF.textColor = UIColor.white
        usernameTF.attributedPlaceholder = NSAttributedString(string: usernameTF.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: UIColor(white: 1.0, alpha: 0.6) ])
        let bottomLayerUsername = CALayer()
        bottomLayerUsername.frame = CGRect(x: 0, y: 29, width: 1000, height: 0.5)
        bottomLayerUsername.backgroundColor = UIColor(displayP3Red: 50/255, green: 50/255, blue: 50/255, alpha: 1).cgColor
        usernameTF.layer.addSublayer(bottomLayerUsername)
        signUpBtn.setTitleColor(UIColor.lightText, for: UIControl.State.normal)
        signUpBtn.isEnabled = false
        handleTextField()
        
    }
    
    @objc func handleTextField() {
        usernameTF.addTarget(self, action: #selector(SignUpViewController.textFieldDidChange), for: UIControl.Event.editingChanged)
        emailTF.addTarget(self, action: #selector(SignUpViewController.textFieldDidChange), for: UIControl.Event.editingChanged)
        passwordTF.addTarget(self, action: #selector(SignUpViewController.textFieldDidChange), for: UIControl.Event.editingChanged)
    }
    
    @objc func textFieldDidChange() {
        guard let username = usernameTF.text, !username.isEmpty, let email = emailTF.text, !email.isEmpty, let password = passwordTF.text, !password.isEmpty else {
            signUpBtn.setTitleColor(UIColor.lightText, for: UIControl.State.normal)
            signUpBtn.isEnabled = false
            return
        }
        
        signUpBtn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        signUpBtn.isEnabled = true
        
    }
    
    @IBAction func b2SignIn(_ sender: Any) {
    dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpBtn(_ sender: Any) {
        view.endEditing(true)
        ProgressHUD.show("Waiting...", interaction: false)
        self.validateFields()
        self.signUp(onSuccess: {
            ProgressHUD.showSuccess("Success")
            self.performSegue(withIdentifier: "signUpToTabBarVC", sender: nil)
            }, onError: { (errorMessage) in
            ProgressHUD.showError(errorMessage)
        })
    }
    
    
}
