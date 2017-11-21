//
//  KJImage.swift
//  WiPassword
//
//  Created by Huni on 22/08/2017.
//  Copyright © 2017 KnighhtJoker. All rights reserved.
//

import UIKit

extension UIImage {
    
    @objc func getImageWithColor(color:UIColor) -> UIImage{
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }

}
