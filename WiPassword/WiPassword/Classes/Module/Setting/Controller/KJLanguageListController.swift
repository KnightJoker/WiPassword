//
//  KJLanguageListController.swift
//  WiPassword
//
//  Created by Huni on 14/11/2017.
//  Copyright © 2017 KnighhtJoker. All rights reserved.
//

import UIKit

enum KJLanguage : Int {
    case chinses                //中文
    case english                //英文
}

class KJLanguageListController: UIViewController {

    let tableView = UITableView()
    var languageArray = Array<String>()                //数据源
    var selectLanguage = KJLanguage.chinses            //当前选择的语言
    
    
    // MARK: - Cycle Life
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initData()
        self.setupView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.initNavigationBar()
    }
    
    func initData() {

        languageArray = ["简体中文","English"]
        if UserDefaults.standard.value(forKey: kUserLanguage) as? String == "en" {
            selectLanguage = .english
        }
        if UserDefaults.standard.value(forKey: kUserLanguage) as? String == "zh-Hans" {
            selectLanguage = .chinses
        }
    }
    
     // MARK: - InitView
    
    func setupView() {
        tableView.backgroundColor = kThemeBackgroundColor
        tableView.register(KJLanguageListCell.self,forCellReuseIdentifier: languageListCellIdentifier)
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) -> Void in
            make.top.left.right.bottom.equalTo(self.view)
        }
    }
    
    func initNavigationBar() {
        self.navigationItem.title = "KJGeneralLanguage".localized
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
        
        if UserDefaults.standard.value(forKey: kUserLanguage) as? String == "en" && selectLanguage != .english {
            KJLocalizationManger.shareManger.setUserLanguage(language: "zh-Hans")
            KJLocalizationManger.reloadRootViewControlle()
        }
        if UserDefaults.standard.value(forKey: kUserLanguage) as? String == "zh-Hans" && selectLanguage != .chinses {
            KJLocalizationManger.shareManger.setUserLanguage(language: "en")
            KJLocalizationManger.reloadRootViewControlle()
        }
        
    }
}

extension KJLanguageListController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = KJLanguageListCell.init(style: UITableViewCellStyle.default, reuseIdentifier: languageListCellIdentifier)
        cell.configCell(Title: languageArray[indexPath.row] , IsSelect: false)
        
        if selectLanguage == .chinses && indexPath.row == 0 {
            cell.configCell(Title: languageArray[indexPath.row] , IsSelect: true)
        }
        if selectLanguage == .english && indexPath.row == 1 {
            cell.configCell(Title: languageArray[indexPath.row] , IsSelect: true)
        }
        return cell
    }
}

extension KJLanguageListController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = kThemeBackgroundColor
        return headerView
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if indexPath.row == 0 {
            selectLanguage = .chinses
        } else {
            selectLanguage = .english
        }
        self.tableView.reloadData()
    }
    
}
