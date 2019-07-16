//
//  SignInViewController+UI.swift
//  THEMedRec
//
//  Created by Williams, Kai on 7/9/19.
//  Copyright © 2019 Williams, Kai. All rights reserved.
//

import Foundation
import ProgressHUD
import FirebaseAuth

extension SignInViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func validateFields() {
        guard let email = self.emailTF.text, !email.isEmpty else {
            ProgressHUD.showError("Please enter an email address")
            return
        }
        guard let password = self.passwordTF.text, !password.isEmpty else {
            ProgressHUD.showError("Please enter a password")
            return
        }
    }
    
    func signIn(onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        ProgressHUD.show()
        Api.User.signIn(email: self.emailTF.text!, password: self.passwordTF.text!, onSuccess: {
            ProgressHUD.dismiss()
            onSuccess()
            self.performSegue(withIdentifier: "signInToTabBarVC", sender: nil)
        }, onError: { (errorMessage) in
            onError(errorMessage!)
            })
    }
    
}
