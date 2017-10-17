//
//  KJSecurityKit.swift
//  WiPassword
//
//  Created by Huni on 10/10/2017.
//  Copyright © 2017 KnighhtJoker. All rights reserved.
//

import Foundation
import RealmSwift


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
                let realm = try! Realm()
                try! realm.write {
                    realm.add(passBox)
                }
            }
        }
    }
    
    // 查询数据库中所有数据
    public func queryAllPasswordBox() -> KJHomeModel {
        
        let homeModel = KJHomeModel()
   
        //      Todo:异步处理
//        DispatchQueue(label: "background").async {
//            autoreleasepool {
//                let realm = try! Realm()
//                let passwordArray = realm.objects(KJPasswordBox.self)
//
//                for passwordBox in passwordArray {
//                    //Todo judge viewModel's type
//                    let homeViewModel = KJHomeViewModel()
//                    homeViewModel.expandStatus = false
//                    homeViewModel.passType = KJHomePasswordType.account
//                    homeViewModel.passwordBox = passwordBox
//                    homeModel.viewModelList.append(homeViewModel)
//                }
//
//            }
//        }
        let realm = try! Realm()
        let passwordArray = realm.objects(KJPasswordBox.self)
        
        for passwordBox in passwordArray {
            //Todo judge viewModel's type
            let homeViewModel = KJHomeViewModel()
            homeViewModel.expandStatus = false
            homeViewModel.passType = KJHomePasswordType.account
            homeViewModel.passwordBox = passwordBox
            homeModel.viewModelList.append(homeViewModel)
        }
        return homeModel
    }
    
    // 删除所有数据
    public func deleteAllPasswordBox() {
        DispatchQueue(label: "background").async {
            autoreleasepool {
                let realm = try! Realm()
                try! realm.write {
                    realm.deleteAll()
                }
            }
        }
    }
    
    // 删除某一个数据
    public func deletePasswordBox(PasswordBox passBox:KJPasswordBox) {
        DispatchQueue(label: "background").async {
            autoreleasepool {
                let realm = try! Realm()
                try! realm.write {
                    realm.delete(passBox)
                }
            }
        }
    }
    
    
    
}
