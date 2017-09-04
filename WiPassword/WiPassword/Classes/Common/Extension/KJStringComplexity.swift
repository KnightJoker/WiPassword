//
//  KJStringComplexity.swift
//  WiPassword
//
//  Created by Huni on 04/09/2017.
//  Copyright © 2017 KnighhtJoker. All rights reserved.
//

import Foundation

extension String {

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
}
