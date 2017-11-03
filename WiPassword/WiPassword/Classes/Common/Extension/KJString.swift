//
//  KJStringComplexity.swift
//  WiPassword
//
//  Created by Huni on 04/09/2017.
//  Copyright © 2017 KnighhtJoker. All rights reserved.
//

import Foundation

extension String {

    // MARK: String Func
    func judgeComplexity(_ s:String) -> Int {
        
        let digital = "0123456789"
        let letter = "abcdefghijklmnopqrstuvwxyz"
        
        
        var digitalCount = 0,charCount = 0,letterCount = 0
        
        for c in s.characters {
            if digital.contains(String(c)) {
                digitalCount += 1
            } else if letter.contains(String(c)) || letter.uppercased().contains(String(c)){
                letterCount += 1
            } else {
                charCount += 1
            }
        }
        
        if digitalCount > 0 && letterCount > 0 && charCount > 0 && s.characters.count > 8 {
            return 2
        } else if (digitalCount > 0 && letterCount > 0 && s.characters.count > 8) || (digitalCount > 0 && charCount > 0 && s.characters.count > 8) || (letterCount > 0 && charCount > 0 && s.characters.count > 8){
            return 1
        } else {
            return 0
        }
    }
    
    func randomPass(Length length:Int) -> String {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789~!@#$%^&*_+."
        let len = UInt32(letters.length)
        
        var randomString = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
    }
    
    
    // MARK: NSLocalizedString
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    func localized(withComment:String) -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: withComment)
    }
    
    func localized(tableName: String) -> String{
        return NSLocalizedString(self, tableName: tableName, bundle: Bundle.main, value: "", comment: "")
    }

}
