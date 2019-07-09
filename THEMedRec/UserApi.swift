//
//  UserApi.swift
//  THEMedRec
//
//  Created by Williams, Kai on 7/9/19.
//  Copyright © 2019 Williams, Kai. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase
import Firebase
import ProgressHUD

class UserApi {
    func signUp(withUsername username: String, email: String, password: String, onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        
        Auth.auth().createUser(withEmail: email, password: password) { (authDataResult, error) in
            if error != nil {
                ProgressHUD.showError(error!.localizedDescription)
                return
            }
            if let authData = authDataResult {
                print(authData.user.email)
                let dict: Dictionary<String, Any> = [
                    UID: authData.user.uid,
                    EMAIL: authData.user.email!,
                    USERNAME: username
                ]
                Database.database().reference().child("users").child(authData.user.uid).updateChildValues(dict, withCompletionBlock: { (error, ref) in
                    if error == nil {
                        onSuccess()
                    } else {
                        onError(error!.localizedDescription)
                    }
                })
            }
        }
    }
    
    func signIn(email: String, password: String, onSuccess: @escaping () -> Void, onError: @escaping (_ errorMessage: String?) -> Void) {
        
        Auth.auth().signIn(withEmail: email, password: password, completion: { (authData, error) in
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            print(authData?.user.uid)
            onSuccess()
        })
    }
}
