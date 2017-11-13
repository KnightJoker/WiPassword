//
//  KJSecurityKit.swift
//  WiPassword
//
//  Created by Huni on 10/10/2017.
//  Copyright © 2017 KnighhtJoker. All rights reserved.
//

import Foundation
import Disk

class KJSecurityKit {
    
    static let sharedInstance = KJSecurityKit()
    private init(){}
    
//    /// realm 数据库的名称
//    static let username = "WiPasswordBox-DB"
//   
//    //--MARK: 初始化 
//    /// 初始化进过加密的 Realm， 加密过的 Realm 只会带来很少的额外资源占用（通常最多只会比平常慢10%）
//    static func initEncryptionRealm() {
//        // 产生随机密钥
//        var key = Data(count: 64)
//        _ = key.withUnsafeMutableBytes {mutableBytes in
//            SecRandomCopyBytes(kSecRandomDefault, key.count, mutableBytes)
//        }
//        // 获取加密 Realm 文件的配置文件
//        var config = Realm.Configuration(encryptionKey: key)
// 
//        config.fileURL =  config.fileURL!.deletingLastPathComponent().appendingPathComponent("\(username).realm")
//
//        let folderPath = config.fileURL!.deletingLastPathComponent().path
//
//        try! FileManager.default.setAttributes([FileAttributeKey.protectionKey: FileProtectionType.none], ofItemAtPath: folderPath)
//        Realm.Configuration.defaultConfiguration = config
//        
//    }
//    
//    /// 初始化默认的 Realm
//    static func initRealm() {
//        
//        var config = Realm.Configuration()
//        
//        config.fileURL =  config.fileURL!.deletingLastPathComponent().appendingPathComponent("\(username).realm")
//        
//        let folderPath = config.fileURL!.deletingLastPathComponent().path
//        
//        try! FileManager.default.setAttributes([FileAttributeKey.protectionKey: FileProtectionType.none],
//                                               ofItemAtPath: folderPath)
//
//        Realm.Configuration.defaultConfiguration = config
//    }
    
    //-- MARK: 操作
    // 添加密码
    public func addPasswordBox(Password passBox:KJPasswordBox) {
        DispatchQueue(label: "background").async {
            autoreleasepool {
                do {
                    if Disk.exists("passwordBox.json", in: .documents) {
                        try Disk.append(passBox, to: "passwordBox.json", in: .documents)
                    } else {
                        try Disk.save([passBox], to: .documents, as: "passwordBox.json")
                    }
                    
                } catch let error as NSError {
                    fatalError("""
                        Domain: \(error.domain)
                        Code: \(error.code)
                        Description: \(error.localizedDescription)
                        Failure Reason: \(error.localizedFailureReason ?? "")
                        Suggestions: \(error.localizedRecoverySuggestion ?? "")
                        """)
                }
            }
        }
       
    }
    
    // 查询数据库中所有数据
    public func queryAllPasswordBox() -> KJHomeModel {
        
        let homeModel = KJHomeModel()
   
        do {
            let passwordBoxs = try Disk.retrieve("passwordBox.json", from: .documents, as: [KJPasswordBox].self)
            for passwordBox in passwordBoxs {
                let homeViewModel = KJHomeViewModel()
                homeViewModel.expandStatus = false
                homeViewModel.passwordBox = passwordBox
                homeModel.viewModelList.append(homeViewModel)
            }
        } catch _ as NSError {
       
        }
        
        return homeModel
    }
    
    public func queryPasswordBox(Key key:String) -> KJHomeModel {
        
        if key == "" {
            return queryAllPasswordBox()
        }
        
        let homeModel = KJHomeModel()
        do {
            let passwordBoxs = try Disk.retrieve("passwordBox.json", from: .documents, as: [KJPasswordBox].self)
            for passwordBox in passwordBoxs {
                
                if passwordBox.title.contains(key) || passwordBox.username.contains(key) {
                    let homeViewModel = KJHomeViewModel()
                    homeViewModel.expandStatus = false
                    homeViewModel.passwordBox = passwordBox
                    homeModel.viewModelList.append(homeViewModel)
                }
            }
        } catch _ as NSError {

        }
       
        return homeModel
    }
    
    // 删除所有数据
    public func deleteAllPasswordBox() {
        DispatchQueue(label: "background").async {
            autoreleasepool {
                do {
                    try Disk.remove("passwordBox.json", from: .documents)
                } catch let error as NSError {
                    fatalError("""
                        Domain: \(error.domain)
                        Code: \(error.code)
                        Description: \(error.localizedDescription)
                        Failure Reason: \(error.localizedFailureReason ?? "")
                        Suggestions: \(error.localizedRecoverySuggestion ?? "")
                        """)
                }
            }
        }
    }
    
    // 删除某一个数据
    public func deletePasswordBox(PasswordBox passBox:KJPasswordBox) {

        DispatchQueue(label: "background").async {
            autoreleasepool {
                do {
                    var passwordBoxs = try Disk.retrieve("passwordBox.json", from: .documents, as: [KJPasswordBox].self)
                    var newPasswordBoxs = Array<KJPasswordBox>()
                    for i in 0..<(passwordBoxs.count) {
                        if passwordBoxs[i].passwordID != passBox.passwordID {
                            newPasswordBoxs.append(passwordBoxs[i])
                        }
                    }
                    try Disk.remove("passwordBox.json", from: .documents)
                    try Disk.save(newPasswordBoxs, to: .documents, as: "passwordBox.json")
                    
                } catch let error as NSError {
                    fatalError("""
                        Domain: \(error.domain)
                        Code: \(error.code)
                        Description: \(error.localizedDescription)
                        Failure Reason: \(error.localizedFailureReason ?? "")
                        Suggestions: \(error.localizedRecoverySuggestion ?? "")
                        """)
                }
            }
        }
    }
    
}
