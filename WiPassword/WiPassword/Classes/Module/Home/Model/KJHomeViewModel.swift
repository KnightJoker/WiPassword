//
//  KJHomeViewModel.swift
//  WiPassword
//
//  Created by Huni on 24/08/2017.
//  Copyright © 2017 KnighhtJoker. All rights reserved.
//

import UIKit


class KJHomeModel {
    var viewModelList = Array<KJHomeViewModel>()
}

class KJHomeViewModel {
    
    var passwordBox = KJPasswordBox()
    var expandStatus : Bool = false
}
