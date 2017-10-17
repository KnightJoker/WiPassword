//
//  KJPasswordBox.swift
//  WiPassword
//
//  Created by Huni on 13/09/2017.
//  Copyright © 2017 KnighhtJoker. All rights reserved.
//

import Foundation
import RealmSwift

class KJPasswordBox: Object {
    @objc dynamic var passwordID : String = ""
    @objc dynamic var title : String = ""
    @objc dynamic var username : String = ""
    @objc dynamic var password : String = ""
    @objc dynamic var note : String = ""
    
    override static func primaryKey() -> String? {
        return "passwordID"
    }
}


