//
//  SignUpViewController.swift
//  THEMedRec
//
//  Created by Williams, Kai on 7/6/19.
//  Copyright © 2019 Williams, Kai. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class SignUpViewController: UIViewController {

    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
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
    }
    
    @IBAction func b2SignIn(_ sender: Any) {
    dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpBtn(_ sender: Any) {
    
        Auth.auth().createUser(withEmail: emailTF.text!, password: passwordTF.text!, completion: { (user, error: Error?) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            
            let ref = Database.database().reference()
            let usersRef = ref.child("users")
            let uid = user?.user.uid
            let newUserRef = usersRef.child(uid!)
            newUserRef.setValue(["username": self.usernameTF.text!, "email": self.emailTF.text!])
            print("description: \(newUserRef.description())")
            
        })
    
    }
    
    
}
