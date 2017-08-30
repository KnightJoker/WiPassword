//
//  KJAddController.swift
//  WiPassword
//
//  Created by Huni on 30/08/2017.
//  Copyright © 2017 KnighhtJoker. All rights reserved.
//

import UIKit

class KJAddController: UIViewController {
    
    let tableView = UITableView.init(frame: CGRect(x:0,y:0,width:0,height:0), style: UITableViewStyle.grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

    // MARK: - init View
    
    func initNavigationBar() {
        self.navigationItem.title = "新建卡片"
        let backItem = UIBarButtonItem(image:UIImage(named:"ic_back_gray"), style:UIBarButtonItemStyle.plain, target:self, action:#selector(backButtonDidClicked))
        backItem.tintColor = kTextNormalColor
        let sureItem = UIBarButtonItem(image:UIImage(named:"ic_sure_green"), style:UIBarButtonItemStyle.plain, target:self, action:#selector(sureButtonDidClicked))
        sureItem.tintColor = kThemeGreenColor
        
        self.navigationItem.leftBarButtonItem = backItem
        self.navigationItem.rightBarButtonItem = sureItem
        
    }
    
    func setupView() {
      
        tableView.backgroundColor = kThemeBackgroundColor
        tableView.register(KJAddRoutineCell.self,forCellReuseIdentifier: addRoutineCellIdentifier)
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.view)
            make.left.right.bottom.equalTo(self.view)
        }
    }
    
    // MARK: events
    
    func backButtonDidClicked() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func sureButtonDidClicked() {
        print("确定")
    }
}

extension KJAddController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = KJAddRoutineCell.init(style: UITableViewCellStyle.default, reuseIdentifier: addRoutineCellIdentifier)
        cell.configCell(Type: KJAddRoutineCellType.defaultCell, Title: "")
        return cell
    }
}

extension KJAddController : UITableViewDelegate {

}











