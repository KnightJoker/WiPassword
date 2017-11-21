//
//  KJDate.swift
//  WiPassword
//
//  Created by Huni on 11/10/2017.
//  Copyright © 2017 KnighhtJoker. All rights reserved.
//

import Foundation

extension Date {
    func nowTimestamp() -> Int {
        let now = NSDate()
        let timeInterval:TimeInterval = now.timeIntervalSince1970
        let timeStamp = Int(timeInterval)
        return timeStamp
    }
}
