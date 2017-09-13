//
//  KJLoginController.swift
//  WiPassword
//
//  Created by Huni on 16/08/2017.
//  Copyright © 2017 KnighhtJoker. All rights reserved.
//

import UIKit
import LocalAuthentication

class KJLoginController: UIViewController {
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.initNavigationBar()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: init View
    func initNavigationBar() {
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    func setupView() {
        self.view.backgroundColor = kThemeBackgroundColor
        
        let logoImageView = UIImageView(image:UIImage(named:"logo"))
        
        let titleLabel = UILabel()
        titleLabel.text = "WiPassword"
        titleLabel.font = kFont22
        titleLabel.textColor = kTextNormalColor
        
        let passTextField = KJTextField()
        passTextField.initWithImage(image: UIImage(named:"ic_password_gray")!, placeHolder: "password")
        passTextField.textFieldValueClosure { (text) in
            print(text)
        }
        
        let loginButton = UIButton()
        loginButton.layer.cornerRadius = 20
        loginButton.setImage(UIImage(named:"ic_touchID_gray"), for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonDidClicked), for:.touchUpInside)
        
        self.view.addSubview(logoImageView)
        self.view.addSubview(titleLabel)
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
        
        passTextField.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(titleLabel.snp.bottom).offset(100)
            make.left.equalTo(35)
            make.right.equalTo(-35)
            make.height.equalTo(40)
        }
        
        loginButton.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(self.view).offset(-65)
            make.centerX.equalTo(self.view)
            make.height.width.equalTo(40)
        }
    }
    
    // MARK: events
    func loginButtonDidClicked() {
        //Todo 账户密码的校验
//        let tabBarVC = KJTabBarController()
//        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
//        self.navigationController?.pushViewController(tabBarVC, animated: true)
//        self.loginWithTouchID()
        self.startTouchID()
        
    }
    
    func startTouchID() {
        let uiAlert = UIAlertController(title: "Title", message: "Message", preferredStyle: UIAlertControllerStyle.alert)
        self.present(uiAlert, animated: true, completion: nil)
        
        uiAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            print("Click of default button")
        }))
        
        uiAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
            print("Click of cancel button")
        }))
    }
    
    func loginWithTouchID() {
        let authContext : LAContext = LAContext()
        var error: NSError?
        
        if authContext.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &error){
            authContext.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "轻触Home键验证已有手机指纹", reply: { successful, error -> Void in
                
                DispatchQueue.main.async(execute: { [weak self] () -> Void in //放到主线程运行。这里特别重要
                    if successful {
                        //调用成功后你想做的事情
                        let tabBarVC = KJTabBarController()
                        self?.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
                        self?.navigationController?.pushViewController(tabBarVC, animated: true)
                        
                    } else {
                        // If authentication failed then show a message to the console with a short description.
                        // In case that the error is a user fallback, then show the password alert view.
                    }
                })
            })
        } else {
            if #available(iOS 9.0, *) {
                authContext.evaluatePolicy(LAPolicy.deviceOwnerAuthentication, localizedReason: "Enter your Passcode", reply: {
                    successful,error in
                    if successful{
                        print("PassCode Yes")
                    } else {
                        print("PassCode No")
                    }
                })
            } else {
                // Fallback on earlier versions
            }
        }
    }
    
}
