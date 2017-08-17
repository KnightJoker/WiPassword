//
//  KJTextField.swift
//  WiPassword
//
//  Created by Huni on 17/08/2017.
//  Copyright © 2017 KnighhtJoker. All rights reserved.
//

import UIKit

class KJTextField: UIView {
    
    let imageView = UIImageView()
    let lineView = UIView()
    let textField = UITextField()
    
    
    func initWithImage(image:UIImage,placeHolder:String) {
        
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        
        lineView.backgroundColor = kLineViewColor
        
//        textField.placeholder = placeHolder
        textField.textColor = kTextNormalColor
        textField.attributedPlaceholder = NSAttributedString(string:placeHolder,
                                                               attributes:[NSForegroundColorAttributeName:kLineViewColor])
    
        self.addSubview(imageView)
        self.addSubview(lineView)
        self.addSubview(textField)
        
        imageView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.width.equalTo(20)
            make.height.equalTo(self)
        }
        
        lineView.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(0)
            make.left.equalTo(0)
            make.width.equalTo(self)
            make.height.equalTo(1)
        }
        
        textField.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(0)
            make.left.equalTo(imageView.snp.right).offset(8)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
        }
        
    }
    
}
