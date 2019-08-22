//
//  Message.swift
//  THEMedRec
//
//  Created by Kai Williams on 8/8/19.
//  Copyright © 2019 Williams, Kai. All rights reserved.
//

import UIKit
import Firebase

class Message: NSObject {
    
    var toId: String?
    var fromId: String?
    var text: String?
    var timestamp: NSNumber?
    var imageUrl: String?
    
    init(dictionary: [String: Any]) {
        self.fromId = dictionary["fromId"] as? String
        self.text = dictionary["text"] as? String
        self.toId = dictionary["toId"] as? String
        self.timestamp = dictionary["timestamp"] as? NSNumber
        self.imageUrl = dictionary["imageUrl"] as? String
    }
    
    func chatPartnerId() -> String? {
        return fromId == Auth.auth().currentUser?.uid ? toId : fromId
    }
}
