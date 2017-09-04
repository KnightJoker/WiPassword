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
    
    // Todo
    case card

}

class KJHomeModel {
    var viewModelList = Array<KJHomeViewModel>()
}

class KJHomeViewModel {
    
    var passType = KJHomePasswordType(rawValue: 0)!
    var title : String = ""
    var username : String = ""
    var password : String = ""
    var expandStatus : Bool = false
    
    
}
