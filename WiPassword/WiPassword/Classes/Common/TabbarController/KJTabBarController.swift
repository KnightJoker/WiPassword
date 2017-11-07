//
//  KJTabBarController.swift
//  WiPassword
//
//  Created by Huni on 21/08/2017.
//  Copyright © 2017 KnighhtJoker. All rights reserved.
//

import UIKit

class KJTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.addTabBarChildViewController(childVC: KJHomeController(), title: "KJTabberHomeTitle".localized, imageName: "ic_home_gray", selectedImageName:"ic_home_green", tag: 0)
        self.addTabBarChildViewController(childVC: KJSettingController(), title: "KJTabberSettingTitle".localized, imageName: "ic_setting_gray", selectedImageName:"ic_setting_green", tag: 0)

        self.tabBar.isTranslucent = false
        self.tabBar.barTintColor = kThemeBlockColor
        self.tabBar.tintColor = kThemeGreenColor
//        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    private func addTabBarChildViewController(childVC: UIViewController, title: String, imageName: String, selectedImageName: String, tag: Int) {
        let vcItem = UITabBarItem.init(title: title, image: UIImage(named:imageName), selectedImage: UIImage(named:selectedImageName))
        childVC.tabBarItem = vcItem
        let naviVC = UINavigationController.init(rootViewController: childVC)
        self.addChildViewController(naviVC)
    }

}


