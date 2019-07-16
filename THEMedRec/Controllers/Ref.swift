//
//  Ref.swift
//  THEMedRec
//
//  Created by Williams, Kai on 7/9/19.
//  Copyright © 2019 Williams, Kai. All rights reserved.
//

import Foundation
import FirebaseDatabase
import Firebase

let REF_USER = "users"
let UID = "uid"
let EMAIL = "email"
let USERNAME = "username"
let ERROR_EMPTY_USERNAME = "Please enter a username"
let ERROR_EMPTY_PASSWORD = "Please enter a password"
let ERROR_EMPTY_EMAIL = "Please enter an email"

class Ref {
    
    let databaseRoot: DatabaseReference = Database.database().reference()
    
    var databaseUsers: DatabaseReference {
        return databaseRoot.child(REF_USER)
    }
    
    func databaseSpecificUser(uid: String) -> DatabaseReference {
        return databaseUsers.child(uid)
    }
    
    func databaseSpecificuser(uid: String) -> DatabaseReference {
        return databaseUsers.child(uid)
    }
}
