//
//  KJModifyPwdController.swift
//  WiPassword
//
//  Created by Huni on 20/10/2017.
//  Copyright © 2017 KnighhtJoker. All rights reserved.
//

import UIKit

class KJModifyPwdController: UIViewController {

    let tableView = UITableView()
    private var oldPwd = String()
    private var newPwd = String()
    private var surePws = String()
    
     // MARK: - Cycle Life
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.initNavigationBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - InitView
    func setupView() {
        tableView.backgroundColor = kThemeBackgroundColor
        tableView.register(KJAddRoutineCell.self,forCellReuseIdentifier: addRoutineCellIdentifier)
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) -> Void in
            make.top.left.right.bottom.equalTo(self.view)
        }
    }
    
    func initNavigationBar() {
        self.navigationItem.title = "KJModifyPwdNavigationTitle".localized
        let backItem = UIBarButtonItem(image:UIImage(named:"ic_back_gray"), style:UIBarButtonItemStyle.plain, target:self, action:#selector(backButtonDidClicked))
        backItem.tintColor = kTextNormalColor
        let sureItem = UIBarButtonItem(image:UIImage(named:"ic_sure_green"), style:UIBarButtonItemStyle.plain, target:self, action:#selector(sureButtonDidClicked))
        sureItem.tintColor = kThemeGreenColor
        self.navigationItem.leftBarButtonItem = backItem
        self.navigationItem.rightBarButtonItem = sureItem
    }
    
    // MARK: - Event
    @objc func backButtonDidClicked() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func sureButtonDidClicked() {
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: kAddEditEndNotification), object: nil)
        // 这个地方逻辑判断，先判断旧密码是否正确，在判断新密码的两次输入是否一致
        if UserDefaults.standard.string(forKey: kHaveLoginPwd) == oldPwd {
            if newPwd == surePws && newPwd != "" {
                UserDefaults.standard.set(newPwd, forKey: kHaveLoginPwd)
                KJAlertController.presentAlertShowTip(Controller: self, Title: "KJTipSetPwdSuccess".localized, Message: "", buttonText: "KJTipOk".localized, ButtonDidClickClosure: {[weak self] Void in
                    self?.navigationController?.popViewController(animated: true)
                })
            } else if newPwd != surePws {
                 KJAlertController.presentAlertShowTip(Controller: self, Title: "KJTipPwdKeepSame".localized, Message: "", buttonText: "KJTipOk".localized, ButtonDidClickClosure: nil)
            } else if newPwd == "" {
                KJAlertController.presentAlertShowTip(Controller: self, Title: "KJTipPwdCanNotBeNULL".localized, Message: "", buttonText: "KJTipOk".localized, ButtonDidClickClosure: nil)
            }
            
        } else {
            KJAlertController.presentAlertShowTip(Controller: self, Title: "KJTipPwdError".localized, Message: "KJTipReEnter".localized, buttonText: "KJTipOk".localized, ButtonDidClickClosure: nil)
        }
        
    }

}

extension KJModifyPwdController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = KJAddRoutineCell.init(style: UITableViewCellStyle.default, reuseIdentifier: addRoutineCellIdentifier)
        
        if indexPath.row == 0 {
            cell.configCell(Type: KJAddRoutineCellType.defaultCell, Title: "KJModiftPwdOriginal".localized)
            cell.setTextField(Text: "", PlaceHolder: "KJModiftPwdOriginalPlaceHolder".localized, SecureTextEntry: true)
            cell.textFieldClosure = {[weak self] (text) -> Void in
                self?.oldPwd = text
            }
        }
        if indexPath.row == 1 {
            cell.configCell(Type: KJAddRoutineCellType.defaultCell, Title: "KJModiftPwdNew".localized)
            cell.setTextField(Text: "", PlaceHolder: "KJModiftPwdNewPlaceHolder".localized, SecureTextEntry: true)
            cell.textFieldClosure = {[weak self] (text) -> Void in
               self?.newPwd = text
            }
        }
        if indexPath.row == 2 {
            cell.configCell(Type: KJAddRoutineCellType.defaultCell, Title: "KJModiftPwdConfirm".localized)
            cell.setTextField(Text: "", PlaceHolder: "KJModiftPwdConfirmPlaceHolder".localized, SecureTextEntry: true)
            cell.textFieldClosure = {[weak self] (text) -> Void in
                self?.surePws = text
            }
        }
        
        return cell
    }
}

extension KJModifyPwdController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
}


