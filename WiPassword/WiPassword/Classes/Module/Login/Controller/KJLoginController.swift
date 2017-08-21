//
//  KJLoginController.swift
//  WiPassword
//
//  Created by Huni on 16/08/2017.
//  Copyright © 2017 KnighhtJoker. All rights reserved.
//

import UIKit


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
        
        let userTextField = KJTextField()
        userTextField.initWithImage(image: UIImage(named:"userName_gray")!, placeHolder: "username")
        userTextField.textFieldValueClosure { (text) in
            print(text)
        }
        
        let passTextField = KJTextField()
        passTextField.initWithImage(image: UIImage(named:"password_gray")!, placeHolder: "password")
        passTextField.textFieldValueClosure { (text) in
            print(text)
        }
        
        let loginButton = UIButton()
        loginButton.backgroundColor = kThemeGreenColor
        loginButton.setTitle("Login", for: UIControlState.normal)
        loginButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        loginButton.addTarget(self, action: #selector(loginButtonDidClicked), for:.touchUpInside)
        
        self.view.addSubview(logoImageView)
        self.view.addSubview(titleLabel)
        self.view.addSubview(userTextField)
        self.view.addSubview(passTextField)
        self.view.addSubview(loginButton)
        
        logoImageView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(120)
            make.centerX.equalTo(self.view)
            make.width.equalTo(75)
            make.height.equalTo(90)
        }
        
        titleLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(logoImageView.snp.bottom).offset(20)
            make.centerX.equalTo(self.view)

        }
        
        userTextField.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(titleLabel.snp.bottom).offset(50)
            make.left.equalTo(35)
            make.right.equalTo(-35)
            make.height.equalTo(30)
        }
        
        passTextField.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(userTextField.snp.bottom).offset(20)
            make.left.equalTo(35)
            make.right.equalTo(-35)
            make.height.equalTo(30)
        }
        
        loginButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(passTextField.snp.bottom).offset(65)
            make.left.equalTo(35)
            make.right.equalTo(-35)
            make.height.equalTo(40)
        }
    }
    
    // MARK: events
    func loginButtonDidClicked() {
        print("Did the button")
    }
}
