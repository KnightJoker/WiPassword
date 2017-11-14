//
//  KJLocalizationManger.swift
//  WiPassword
//
//  Created by Huni on 14/11/2017.
//  Copyright © 2017 KnighhtJoker. All rights reserved.
//

import UIKit

class KJLocalizationManger: NSObject {
    
    var bundle:Bundle?
    
    static let shareManger:KJLocalizationManger = {
        
        let instance = KJLocalizationManger()
        return instance
    }()
    
    override init() {
        
        super.init()
        
        initLanguage()
    }
    
    func setUserLanguage(language:String) {
        
        UserDefaults.standard.setValue(language, forKey: kUserLanguage)
        UserDefaults.standard.synchronize()
        
        let bundlePath = Bundle.main.path(forResource: language, ofType: "lproj")
        
        bundle = Bundle.init(path: bundlePath!)
        
    }
    
    func localizedString(_ key: String) -> String {

        return NSLocalizedString(key, tableName: "", bundle: bundle!, value: "", comment: "")
    }
    
    func initLanguage() {
        
        if let userLanguage = UserDefaults.standard.value(forKey: kUserLanguage) as? String   {
            
            let bundlePath = Bundle.main.path(forResource: userLanguage, ofType: "lproj")
            
            bundle = Bundle.init(path: bundlePath!)
            
        } else {
            
            var language = NSLocale.preferredLanguages.first
            
            UserDefaults.standard.setValue(language, forKey: kUserLanguage)
            
            if (language == "zh-Hans-HK") || (language == "zh-Hans-CN") || (language == "zh-Hans") || (language == "zh-Hans-US") {
                
                language = "zh-Hans"
                
            } else {
                
                language = "en"
            }
            
            UserDefaults.standard.setValue(language, forKey: kUserLanguage)
            UserDefaults.standard.synchronize()
            
            let bundlePath = Bundle.main.path(forResource: language, ofType: "lproj")
            
            bundle = Bundle.init(path: bundlePath!)
        }
        
    }
    
    // Class methed
    class func reloadRootViewControlle() {
        let delegate = UIApplication.shared.delegate!
        let tabbarVc = KJTabBarController()
        delegate.window??.rootViewController = tabbarVc
    }
}

extension String {
    // MARK: NSLocalizedString
    var localized: String {
        return KJLocalizationManger.shareManger.localizedString(self)
    }
}
