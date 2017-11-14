//
//  KJGeneralController.swift
//  WiPassword
//
//  Created by Huni on 14/11/2017.
//  Copyright © 2017 KnighhtJoker. All rights reserved.
//

import UIKit

class KJGeneralController: UIViewController {
    
    let tableView = UITableView()

    // MARK: - Cycle Life
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.initNavigationBar()
    }
    // MARK: - InitView
    
    func setupView() {
        tableView.backgroundColor = kThemeBackgroundColor
        tableView.register(KJSettingRoutineCell.self,forCellReuseIdentifier: settingRoutineCellIdentifier)
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) -> Void in
            make.top.left.right.bottom.equalTo(self.view)
        }
    }
    
    func initNavigationBar() {
        self.navigationItem.title = "KJGeneralNavigationTitle".localized
        let backItem = UIBarButtonItem(image:UIImage(named:"ic_back_gray"), style:UIBarButtonItemStyle.plain, target:self, action:#selector(backButtonDidClicked))
        backItem.tintColor = kTextNormalColor
        self.navigationItem.leftBarButtonItem = backItem
    }
    
    // MARK: - Event
    @objc func backButtonDidClicked() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension KJGeneralController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = KJSettingRoutineCell.init(style: UITableViewCellStyle.default, reuseIdentifier: settingRoutineCellIdentifier)
        cell.configCell(Icon: UIImage(), Title: "KJGeneralLanguage".localized, Type: KJSettingRoutineCellType.titleCell)
        return cell
    }
}

extension KJGeneralController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // 语言
        if indexPath.section == 0 && indexPath.row == 0 {
            let languageVc = KJLanguageListController()
            languageVc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(languageVc, animated: true)
        }

    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = kThemeBackgroundColor
        return headerView
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }
    
}
