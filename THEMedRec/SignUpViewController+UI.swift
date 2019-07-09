//
//  SignUpViewController+UI.swift
//  THEMedRec
//
//  Created by Williams, Kai on 7/9/19.
//  Copyright © 2019 Williams, Kai. All rights reserved.
//

import Foundation
import ProgressHUD

extension SignUpViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func validateFields() {
        guard let username = self.usernameTF.text, !username.isEmpty else {
            ProgressHUD.showError(ERROR_EMPTY_USERNAME)
            return
        }
        guard let email = self.emailTF.text, !email.isEmpty else {
            ProgressHUD.showError(ERROR_EMPTY_EMAIL)
            return
        }
        guard let password = self.passwordTF.text, !password.isEmpty else {
            ProgressHUD.showError(ERROR_EMPTY_PASSWORD)
            return
        }
    }
    
    func signUp(onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage:String) -> Void) {
        ProgressHUD.show()
        Api.User.signUp(withUsername: self.usernameTF.text!, email: self.emailTF.text!, password: self.passwordTF.text!, onSuccess: {
            ProgressHUD.dismiss()
            onSuccess()
        }, onError: { (errorMessage) in
            onError(errorMessage)
            })
    }

}
