//
//  SignUpViewController+UI.swift
//  THEMedRec
//
//  Created by Williams, Kai on 7/9/19.
//  Copyright © 2019 Williams, Kai. All rights reserved.
//

import Foundation
import ProgressHUD
import Firebase
import FirebaseStorage

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
        Api.User.signUp(withUsername: self.usernameTF.text!, email: self.emailTF.text!, password: self.passwordTF.text!, image: self.image, onSuccess: {
            ProgressHUD.dismiss()
            onSuccess()
        }, onError: { (errorMessage) in
            onError(errorMessage)
            })
    }
    
    func setupProfileImage() {
        profileImage.layer.cornerRadius = 55
        profileImage.clipsToBounds = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(presentPicker))
        profileImage.addGestureRecognizer(tapGesture)
    }
    
    @objc func presentPicker() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }

}

extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageSelected = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            image = imageSelected
            profileImage.image = imageSelected
        }
        
        if let imageOriginal = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            image = imageOriginal
            profileImage.image = imageOriginal
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
