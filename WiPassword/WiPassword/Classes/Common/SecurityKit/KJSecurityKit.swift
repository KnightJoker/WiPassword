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
    
    static let shared = KJSecurityKit()
    private init(){}
    
//    private let realm = try! Realm()
    let myRealmQueue = DispatchQueue(label: "realmQueue", qos: .background)
    
    // 添加密码
    public func addPasswordBox(Password passBox:KJPasswordBox) {
        
//        myRealmQueue.async{
//            do{
//                //Do your realm stuff in this queue.
//                let realm = try! Realm()
//                try! realm.write {
//                    realm.add(passBox)
//                }
//            }
//        }
        
        DispatchQueue(label: "background").async {
            autoreleasepool {

                let realm = try! Realm()
                try! realm.write {
                    realm.add(passBox)
                }
            }
        }
        
//        let realm = try! Realm()

//        try! realm.write {
//            realm.add(passBox)
//        }

    }
    
    // 查询数据库中所有数据
    public func queryAllPasswordBox() -> KJHomeModel {
        
        
        let realm = try! Realm()
        let passwordArray = realm.objects(KJPasswordBox.self)
        let homeModel = KJHomeModel()
        
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
}
