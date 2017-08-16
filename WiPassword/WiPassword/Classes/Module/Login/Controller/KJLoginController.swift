//
//  KJLoginController.swift
//  WiPassword
//
//  Created by Huni on 16/08/2017.
//  Copyright © 2017 KnighhtJoker. All rights reserved.
//

import UIKit
import SnapKit

class KJLoginController: UIViewController {
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: init View
    
    func setupView() {
        self.view.backgroundColor = kThemeBackgroundColor
        
        let logoImageView = UIImageView(image:UIImage(named:"logo"))
        
        let titleLabel = UILabel()
        titleLabel.text = "WiPassword"
        titleLabel.font = kFont22
        titleLabel.textColor = kTextNormalColor
        
        self.view.addSubview(logoImageView)
        self.view.addSubview(titleLabel)
        
        logoImageView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(100)
            make.centerX.equalTo(self.view)
            make.width.equalTo(75)
            make.height.equalTo(90)
        }
        
        titleLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(logoImageView.snp.bottom).offset(40)
            make.centerX.equalTo(self.view)

        }
    }
}
