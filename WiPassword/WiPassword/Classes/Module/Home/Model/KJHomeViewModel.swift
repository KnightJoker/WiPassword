//
//  KJHomeViewModel.swift
//  WiPassword
//
//  Created by Huni on 24/08/2017.
//  Copyright © 2017 KnighhtJoker. All rights reserved.
//

import UIKit

enum KJHomePasswordType : Int {
    
    case account
    
    case mail
    
    case message
    
    case card

}

class KJHomeViewModel {
    
    var passType = KJHomePasswordType(rawValue: 0)!
    var title : String = ""
    var username : String = ""
    var password : String = ""
    
}
