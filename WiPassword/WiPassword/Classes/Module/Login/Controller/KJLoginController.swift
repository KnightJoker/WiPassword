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
    
    private let logoImageView = UIImageView(image:UIImage(named:"logo"))
    private let titleLabel = UILabel()
    private let passTextField = KJTextField()
    private let touchButton = UIButton()
    
    private let registeredBackgroundView = UIView()
    private let registeredPwdField = KJTextField()
    private let registeredSurePwdField = KJTextField()
    private let registeredButton = UIButton()
    private var password = String()
    private var surePwd = String()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
         self.setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.initNavigationBar()
        if UserDefaults.standard.bool(forKey: kIsTouchId) {
            self.loginWithTouchID()
        } 
    }
    
    override func viewDidDisappear(_ animated: Bool) {

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: init View
    private func initNavigationBar() {
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    private func setupView() {
        self.view.backgroundColor = kThemeBackgroundColor
        self.view.addGestureRecognizer(UITapGestureRecognizer(target:self, action:#selector(handleTap(sender:))))
        
        titleLabel.text = "KJLoginLogoName".localized
        titleLabel.font = kFont22
        titleLabel.textColor = kTextNormalColor
        

        
        self.view.addSubview(logoImageView)
        self.view.addSubview(titleLabel)

        
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
        
        
        if (UserDefaults.standard.object(forKey: kHaveLoginPwd) != nil) {
            self.removeRegisteredView()
            self.setupLoginView()
        } else {
            self.setupRegisteredView()
            self.removeLoginView()
        }
    }
    
    private func setupLoginView() {
        
        passTextField.initWithImage(image: UIImage(named:"ic_password_gray")!, placeHolder: "password")
        passTextField.textFieldValueClosure {[weak self] (text) in
            if UserDefaults.standard.string(forKey: kHaveLoginPwd) == text {
                let tabBarVC = KJTabBarController()
                self?.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
                self?.navigationController?.pushViewController(tabBarVC, animated: true)
            } else {
                KJAlertController.presentAlertShowTip(Controller: self!, Title: "KJTipPwdError".localized, Message: "", buttonText: "KJTipOk".localized, ButtonDidClickClosure: nil)
            }
        }
        
        touchButton.layer.cornerRadius = 20
        touchButton.setImage(UIImage(named:"ic_touchID_gray"), for: .normal)
        touchButton.addTarget(self, action: #selector(touchButtonDidClicked), for:.touchUpInside)
        
        self.view.addSubview(passTextField)
        self.view.addSubview(touchButton)
        
        passTextField.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(titleLabel.snp.bottom).offset(100)
            make.left.equalTo(35)
            make.right.equalTo(-35)
            make.height.equalTo(40)
        }
        
        touchButton.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(self.view).offset(-65)
            make.centerX.equalTo(self.view)
            make.height.width.equalTo(40)
        }
        
    }
    
    private func removeLoginView() {
        passTextField.removeFromSuperview()
        touchButton.removeFromSuperview()
    }
    
    private func setupRegisteredView() {
        
        registeredBackgroundView.backgroundColor = kThemeBackgroundColor
        
        registeredPwdField.initWithImage(image: UIImage(named:"ic_password_gray")!, placeHolder: "KJLoginInitPwd".localized)
        registeredPwdField.textFieldValueClosure {[weak self] (text) in
            self?.password = text
        }
        registeredSurePwdField.initWithImage(image: UIImage(named:"ic_surePassword_gray")!, placeHolder: "KJLoginEnterPwd".localized)
        registeredSurePwdField.textFieldValueClosure {[weak self] (text) in
            self?.surePwd = text
        }
        
        registeredButton.backgroundColor = kThemeBackgroundColor
        registeredButton.layer.borderWidth = 1.0
        registeredButton.layer.borderColor = kThemeGreenColor.cgColor
        registeredButton.setTitle("KJLoginSignUp".localized, for: UIControlState.normal)
        registeredButton.addTarget(self, action: #selector(registeredButtonDidClicked), for:.touchUpInside)
        
        self.view.addSubview(registeredBackgroundView)
        self.view.addSubview(registeredPwdField)
        self.view.addSubview(registeredSurePwdField)
        self.view.addSubview(registeredButton)
        
        registeredBackgroundView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(titleLabel.snp.bottom)
            make.left.right.bottom.equalTo(self.view)
        }
        
        registeredPwdField.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(titleLabel.snp.bottom).offset(50)
            make.left.equalTo(35)
            make.right.equalTo(-35)
            make.height.equalTo(40)
        }
        registeredSurePwdField.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(registeredPwdField.snp.bottom).offset(20)
            make.left.equalTo(35)
            make.right.equalTo(-35)
            make.height.equalTo(40)
        }
        registeredButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(registeredSurePwdField.snp.bottom).offset(60)
            make.left.equalTo(35)
            make.right.equalTo(-35)
            make.height.equalTo(40)
        }
        
    }
    
   private func removeRegisteredView() {
        registeredBackgroundView.removeFromSuperview()
        registeredPwdField.removeFromSuperview()
        registeredSurePwdField.removeFromSuperview()
        registeredButton.removeFromSuperview()
    }
    
    // MARK: events
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            passTextField.textField.resignFirstResponder()
            registeredPwdField.textField.resignFirstResponder()
            registeredSurePwdField.textField.resignFirstResponder()
        }
        sender.cancelsTouchesInView = false
    }
    
    @objc func touchButtonDidClicked() {
//        let tabBarVC = KJTabBarController()
//        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
//        self.navigationController?.pushViewController(tabBarVC, animated: true)
        
        if UserDefaults.standard.bool(forKey: kIsTouchId) {
            self.loginWithTouchID()
        } else {
            KJAlertController.presentAlertController(Controller: self, Title: "KJTipOpenTouchId".localized, Message: "", LeftButtonText: "KJTipCancel".localized, RightButtonText: "KJTipConfirm".localized, LeftButtonClosure: nil, RightButtonClosure: { Void in
                UserDefaults.standard.set(true, forKey: kIsTouchId)
                self.loginWithTouchID()
            })
        }
        

    }
    
    @objc func registeredButtonDidClicked() {
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: kloginEditEndNotification), object: nil)
        if password == surePwd && password != "" {
            // Todo 初始密码安全设置
            UserDefaults.standard.set(password, forKey: kHaveLoginPwd)
            let tabBarVC = KJTabBarController()
            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
            self.navigationController?.pushViewController(tabBarVC, animated: true)
        } else if password == "" {
            KJAlertController.presentAlertShowTip(Controller: self, Title: "KJTipPwdCanNotBeNULL".localized, Message: "", buttonText: "KJTipOk".localized, ButtonDidClickClosure: nil)
        } else {
            KJAlertController.presentAlertShowTip(Controller: self, Title: "KJTipPwdKeepSame".localized, Message: "", buttonText: "KJTipOk".localized, ButtonDidClickClosure: nil)
        }
    }
    
    @objc func loginWithTouchID() {
        let authContext : LAContext = LAContext()
        var error: NSError?
        
        if authContext.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &error){
            authContext.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "KJTipTouchId".localized, reply: { successful, error -> Void in
                
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
                        KJAlertController.presentAlertShowTip(Controller: self, Title: "KJTipTouchIdError".localized, Message: "KJTipSetTouchId".localized, buttonText: "KJTipOk".localized, ButtonDidClickClosure: nil)
                    }
                })
            } else {
                // Fallback on earlier versions
            }
        }
    }
    
}
