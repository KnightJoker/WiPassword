//
//  KJTextField.swift
//  WiPassword
//
//  Created by Huni on 17/08/2017.
//  Copyright © 2017 KnighhtJoker. All rights reserved.
//

import UIKit



class KJTextField: UIView {
    
    @objc let imageView = UIImageView()
    @objc let lineView = UIView()
    @objc let textField = UITextField()
    
    typealias textFieldString = (_ text:String) -> Void
    @objc var textFieldReturnClosure: textFieldString?
    
    @objc func textFieldValueClosure(closure:textFieldString?){
        textFieldReturnClosure = closure
    }
    
    
    @objc func initWithImage(image:UIImage,placeHolder:String) {
        
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        
        lineView.backgroundColor = kLineViewColor
        
        textField.textColor = kTextNormalColor
        textField.returnKeyType = UIReturnKeyType.go
        textField.delegate = self
        textField.attributedPlaceholder = NSAttributedString(string:placeHolder,
                                                               attributes:[NSAttributedStringKey.foregroundColor:kLineViewColor])
    
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

extension KJTextField: UITextFieldDelegate {

    public func textFieldDidEndEditing(_ textField: UITextField) {
        if (textFieldReturnClosure != nil) {
            textFieldReturnClosure!(textField.text!)
        }
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()  
//        if (textFieldReturnClosure != nil) {
//            textFieldReturnClosure!(textField.text!)
//        }
        return true
    }
}
