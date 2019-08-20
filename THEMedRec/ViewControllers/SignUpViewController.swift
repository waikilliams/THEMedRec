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
import FirebaseStorage

class SignUpViewController: UIViewController {
    
    var messagesContoller: MessageTableViewController?
    
    let inputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var registerBtn: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 96, g: 96, b: 96)
        button.setTitle("Sign Up", for: UIControl.State())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: UIControl.State())
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        
        button.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        return button
    }()
    
    let usernameTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Username"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let passwordTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        return tf
    }()
    
    let emailTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let usernameSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let emailSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var  profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = UIColor.white
        imageView.image = UIImage(named: "profilePlaceHolder")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 75
        imageView.layer.masksToBounds = true
        
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(presentPicker)))
        imageView.isUserInteractionEnabled = true
        
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(r: 0, g: 0, b: 0)
        
        view.addSubview(inputsContainerView)
        view.addSubview(registerBtn)
        view.addSubview(profileImageView)
        
        setupInputsContainerView()
        setupRegisterBtn()
        setupProfileImageView()
    }
    
    func setupInputsContainerView() {
        //register button x, y, width, height constraints
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputsContainerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        inputsContainerView.addSubview(usernameTF)
        inputsContainerView.addSubview(usernameSeperatorView)
        inputsContainerView.addSubview(emailTF)
        inputsContainerView.addSubview(emailSeperatorView)
        inputsContainerView.addSubview(passwordTF)
        
        //username textfield x, y, width, height constraints
        usernameTF.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        usernameTF.topAnchor.constraint(equalTo: inputsContainerView.topAnchor).isActive = true
        usernameTF.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        usernameTF.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3).isActive = true
        //username seperator x, y, width, height constraints
        usernameSeperatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        usernameSeperatorView.topAnchor.constraint(equalTo: usernameTF.bottomAnchor).isActive = true
        usernameSeperatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        usernameSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        //email textfield x, y, width, height constraints
        emailTF.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        emailTF.topAnchor.constraint(equalTo: usernameTF.bottomAnchor).isActive = true
        emailTF.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        emailTF.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3).isActive = true
        //email seperator x, y, width, height constraints
        emailSeperatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        emailSeperatorView.topAnchor.constraint(equalTo: emailTF.bottomAnchor).isActive = true
        emailSeperatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        emailSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        //password textfield x, y, width, height constraints
        passwordTF.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        passwordTF.topAnchor.constraint(equalTo: emailTF.bottomAnchor).isActive = true
        passwordTF.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        passwordTF.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3).isActive = true
    }
    
    func setupProfileImageView() {
        //profile image x, y, width, height constraints
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: -24).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func setupRegisterBtn() {
        //register button x, y, width, height constraints
        registerBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerBtn.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor, constant: 12).isActive = true
        registerBtn.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        registerBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    @IBAction func b2SignIn(_ sender: Any) {
    dismiss(animated: true, completion: nil)
    }
    
}

