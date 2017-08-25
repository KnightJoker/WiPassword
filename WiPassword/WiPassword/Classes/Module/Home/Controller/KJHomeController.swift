//
//  KJHomeController.swift
//  WiPassword
//
//  Created by Huni on 21/08/2017.
//  Copyright © 2017 KnighhtJoker. All rights reserved.
//

import UIKit

class KJHomeController: UIViewController {

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
    
    // MARK: - init View
    func initNavigationBar() {
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage().getImageWithColor(color: kThemeBlockColor), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage().getImageWithColor(color: kThemeBlockColor)
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.barTintColor = kThemeBlockColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: kTextNormalColor]
        self.navigationItem.title = "密码管理"

        let leftItem = UIBarButtonItem(image:UIImage(named:"ic_menu_gray"), style:UIBarButtonItemStyle.plain, target:self, action:#selector(leftButtonDidClicked))
        leftItem.tintColor = kTextNormalColor
        let rightItem = UIBarButtonItem(image:UIImage(named:"ic_add_green"), style:UIBarButtonItemStyle.plain, target:self, action:#selector(rightButtonDidClicked))
        rightItem.tintColor = kThemeGreenColor
        
        self.navigationItem.leftBarButtonItem = leftItem
        self.navigationItem.rightBarButtonItem = rightItem
        
        
    }
    
    func setupView() {
        
        let searchBar = UISearchBar.init()
        searchBar.backgroundImage = UIImage().getImageWithColor(color: kThemeBlockColor)
        let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.backgroundColor = kThemeBackgroundColor
        textFieldInsideSearchBar?.textColor = kTextNormalColor
        
        self.view.addSubview(searchBar)
        searchBar.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(64)
            make.centerX.equalTo(self.view)
            make.width.equalTo(self.view)
            make.height.equalTo(45)
        }
        
        tableView.backgroundColor = kThemeBackgroundColor
        tableView.register(KJHomeCell.self,forCellReuseIdentifier: homeCellIdentifier)
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(searchBar.snp.bottom)
            make.left.right.bottom.equalTo(self.view)
        }
        
    }
    
    // MARK: - Event
    func leftButtonDidClicked() {
        print("左边")
    }
    
    func rightButtonDidClicked() {
        print("右边")
    }
}

extension KJHomeController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = KJHomeCell.init(style: UITableViewCellStyle.default, reuseIdentifier: homeCellIdentifier)
        let tempModel = KJHomeViewModel()
        tempModel.title = "我的Email"
        tempModel.username = "huni@git.com"
        tempModel.passType = KJHomePasswordType.mail
        cell.updateHomeCellWithModel(tempModel)
        return cell
    }
}

extension KJHomeController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?  {
        let headerView = UIView()
        headerView.backgroundColor = kThemeBackgroundColor
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 4.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}




