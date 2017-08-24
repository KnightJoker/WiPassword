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
    
    typealias textFieldString = (_ text:String) -> Void
    var textFieldReturnClosure: textFieldString?
    
    func textFieldValueClosure(closure:textFieldString?){
        textFieldReturnClosure = closure
    }
    
    
    func initWithImage(image:UIImage,placeHolder:String) {
        
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        
        lineView.backgroundColor = kLineViewColor
        
        textField.textColor = kTextNormalColor
        textField.delegate = self
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

extension KJTextField: UITextFieldDelegate {

    public func textFieldDidEndEditing(_ textField: UITextField) {
        if (textFieldReturnClosure != nil) {
            textFieldReturnClosure!(textField.text!)
        }
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if (textFieldReturnClosure != nil) {
            textFieldReturnClosure!(textField.text!)
        }
        
        return true
    }
}
