//
//  KJThemeColor.swift
//  WiPassword
//
//  Created by Huni on 16/08/2017.
//  Copyright © 2017 KnighhtJoker. All rights reserved.
//

import UIKit

public let kThemeBackgroundColor    :UIColor    = UIColor.hexColor(hexColor:0x29292B)
public let kThemeBlockColor         :UIColor    = UIColor.hexColor(hexColor:0x222224)
public let kThemeDeepBlockColor     :UIColor    = UIColor.hexColor(hexColor:0x141415)
public let kTextNormalColor         :UIColor    = UIColor.hexColor(hexColor:0xDCDCDC)
public let kLineViewColor           :UIColor    = UIColor.hexColor(hexColor:0x8C8C8C)
public let kThemeGreenColor         :UIColor    = UIColor.hexColor(hexColor:0x36BE6A)

extension UIColor {
    static func hexColor(hexColor:Int64) -> UIColor{
        
        let red = ((CGFloat)((hexColor & 0xFF0000) >> 16))/255.0;
        let green = ((CGFloat)((hexColor & 0xFF00) >> 8))/255.0;
        let blue = ((CGFloat)(hexColor & 0xFF))/255.0;
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
        
    }
}


