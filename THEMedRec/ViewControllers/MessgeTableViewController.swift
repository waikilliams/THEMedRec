//
//  MessgeTableViewController.swift
//  THEMedRec
//
//  Created by Kai Williams on 7/15/19.
//  Copyright © 2019 Williams, Kai. All rights reserved.
//

import UIKit
import Firebase

class MessgeTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "newMessage")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image , style: .plain, target: self, action: #selector(handleNewMessage))
        checkIfUserIsLoggedIn()
    }
    
    @objc func handleNewMessage() {
        let newMessageController = NewMessageViewController()
        let navController = UINavigationController(rootViewController: newMessageController)
        present(navController, animated: true, completion: nil)
    }
    
    func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser?.uid == nil {
            perform(#selector(handleLoggout), with: nil, afterDelay: 0)
        } else {
            let uid = Auth.auth().currentUser?.uid
            Database.database().reference().child("users").child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
            
            if let dictionary = snapshot.value as? [String: AnyObject] {
                self.navigationItem.title = dictionary["username"] as? String
        }
            
                }, withCancel: nil)
        }
    }
    
    @objc func handleLoggout() {
        do {
            try Auth.auth().signOut()
        } catch let logOutError {
            print(logOutError)
        }
        let signInController = SignInViewController()
        present(signInController, animated: true, completion: nil)
    }
}
