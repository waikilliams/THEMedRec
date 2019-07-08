//
//  SignInViewController.swift
//  THEMedRec
//
//  Created by Williams, Kai on 7/6/19.
//  Copyright © 2019 Williams, Kai. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

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
        
    }
    
}
