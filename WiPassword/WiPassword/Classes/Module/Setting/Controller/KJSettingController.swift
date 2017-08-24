//
//  KJSettingController.swift
//  WiPassword
//
//  Created by Huni on 22/08/2017.
//  Copyright © 2017 KnighhtJoker. All rights reserved.
//

import UIKit

class KJSettingController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.initNavigationBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initNavigationBar() {
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage().getImageWithColor(color: kThemeBlockColor), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage().getImageWithColor(color: kThemeBlockColor)
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.barTintColor = kThemeBlockColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: kTextNormalColor]
        self.navigationItem.title = "设置"
    }

    func setupView() {
        self.view.backgroundColor = kThemeBackgroundColor
    }

}
