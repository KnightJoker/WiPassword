//
//  KJPasswordBox.swift
//  WiPassword
//
//  Created by Huni on 13/09/2017.
//  Copyright © 2017 KnighhtJoker. All rights reserved.
//

import Foundation
import Disk

enum KJPasswordType : Int {
    case passwordTypeStar  = 0         //标记
    case passwordTypeSocial = 1        //社交
    case passwordTypeEmail  = 2        //邮件
}

class KJPasswordBox: Codable {
    @objc dynamic var passwordID : String = ""
    @objc dynamic var title : String = ""
    @objc dynamic var username : String = ""
    @objc dynamic var password : String = ""
    @objc dynamic var note : String = ""
    @objc dynamic var type : Int = 0
    
//    override static func primaryKey() -> String? {
//        return "passwordID"
//    }
}


