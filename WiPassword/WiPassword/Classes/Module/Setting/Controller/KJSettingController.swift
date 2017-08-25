//
//  KJSettingController.swift
//  WiPassword
//
//  Created by Huni on 22/08/2017.
//  Copyright © 2017 KnighhtJoker. All rights reserved.
//

import UIKit

class KJSettingController: UIViewController {

    let tableView = UITableView.init()
    
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
        
        tableView.backgroundColor = kThemeBlockColor
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.register(KJSettingRoutineCell.self,forCellReuseIdentifier: settingRoutineCellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.view)
            make.left.right.bottom.equalTo(self.view)
        }
    }

}

extension KJSettingController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = KJSettingRoutineCell.init(style: UITableViewCellStyle.default, reuseIdentifier: settingRoutineCellIdentifier)
        

        if indexPath.section == 0 && indexPath.row == 0 {
            cell.configCell(Icon: UIImage(named:"ic_username_green")!, Title: "账户信息", Type: KJSettingRoutineCellType.defaultCell)
        } else if indexPath.section == 0 && indexPath.row == 1 {
            cell.configCell(Icon: UIImage(named:"ic_password_green")!, Title: "安全设置", Type: KJSettingRoutineCellType.defaultCell)
        } else if indexPath.section == 1 && indexPath.row == 0 {
            cell.configCell(Icon: UIImage(named:"ic_notification_green")!, Title: "系统通知", Type: KJSettingRoutineCellType.switchCell)
        } else if indexPath.section == 1 && indexPath.row == 1 {
            cell.configCell(Icon: UIImage(named:"ic_username_green")!, Title: "Touch ID", Type: KJSettingRoutineCellType.switchCell)
        } else if indexPath.section == 2 && indexPath.row == 0 {
            cell.configCell(Icon: UIImage(named:"ic_suggestion_green")!, Title: "反馈与意见", Type: KJSettingRoutineCellType.defaultCell)
        } else if indexPath.section == 2 && indexPath.row == 1 {
            cell.configCell(Icon: UIImage(named:"ic_about_green")!, Title: "关于我们", Type: KJSettingRoutineCellType.defaultCell)
        }
        
        
        
        return cell
    }
}

extension KJSettingController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = kThemeBlockColor
        return headerView
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 15.0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
