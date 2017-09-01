//
//  KJSkiddingController.swift
//  WiPassword
//
//  Created by Huni on 01/09/2017.
//  Copyright © 2017 KnighhtJoker. All rights reserved.
//

import UIKit

private var selectCell = 0          //默认选中的Cell

class KJSkiddingController: UIViewController {

    let tableView = UITableView.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK : setupView
    func setupView() {
        self.view.backgroundColor = kThemeDeepBlockColor
        
        tableView.backgroundColor = kThemeDeepBlockColor
        tableView.register(KJSkiddingCell.self,forCellReuseIdentifier: skiddingCellIdentifier)
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(110)
            make.left.right.bottom.equalTo(self.view)
        }
    
    }

}

extension KJSkiddingController : UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = KJSkiddingCell.init(style: UITableViewCellStyle.default, reuseIdentifier: skiddingCellIdentifier)
        cell.configCell(Image: "ic_allAndHome", Title: "全部")
        if indexPath.row == selectCell {
            cell.selectCellStyle()
        }
        
        return cell
    }
}

extension KJSkiddingController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectCell = indexPath.row
        tableView.reloadData()
    }

}
