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
        self.navigationItem.title = "修改登录密码"
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
        
    }

}

extension KJModifyPwdController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = KJAddRoutineCell.init(style: UITableViewCellStyle.default, reuseIdentifier: addRoutineCellIdentifier)
        
        if indexPath.row == 0 {
            cell.configCell(Type: KJAddRoutineCellType.defaultCell, Title: "初始密码")
            cell.setTextField(Text: "", PlaceHolder: "请输入登陆密码", SecureTextEntry: true)
            cell.textFieldClosure = {[weak self] (text) -> Void in
                
            }
        }
        if indexPath.row == 1 {
            cell.configCell(Type: KJAddRoutineCellType.defaultCell, Title: "新密码")
            cell.setTextField(Text: "", PlaceHolder: "请输入新的密码", SecureTextEntry: true)
            cell.textFieldClosure = {[weak self] (text) -> Void in
                
            }
        }
        if indexPath.row == 2 {
            cell.configCell(Type: KJAddRoutineCellType.defaultCell, Title: "确认密码")
            cell.setTextField(Text: "", PlaceHolder: "再次输入新的密码", SecureTextEntry: true)
            cell.textFieldClosure = {[weak self] (text) -> Void in
                
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


