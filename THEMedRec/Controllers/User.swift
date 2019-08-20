//
//  User.swift
//  THEMedRec
//
//  Created by Kai Williams on 7/15/19.
//  Copyright © 2019 Williams, Kai. All rights reserved.
//

import UIKit
import Firebase

class User: NSObject {
    var id: String?
    var username: String?
    var email: String?
    var profileImageUrl: String?

    init(dictionary: [String: Any]) {
        self.id = dictionary["id"] as? String
        self.username = dictionary["username"] as? String
        self.email = dictionary["email"] as? String
        self.profileImageUrl = dictionary["profileImageUrl"] as? String
    }
}
