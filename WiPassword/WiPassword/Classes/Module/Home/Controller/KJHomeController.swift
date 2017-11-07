//
//  KJHomeController.swift
//  WiPassword
//
//  Created by Huni on 21/08/2017.
//  Copyright © 2017 KnighhtJoker. All rights reserved.
//

import UIKit

private var skiddingButtonStatus = false
private let kSkiddingViewAnimationTime = 0.3

class KJHomeController: UIViewController {
    
    private let skiddingVC = KJSkiddingController()
    private let maskedGesture = UITapGestureRecognizer()            //侧滑的手势
    private let handleGesture = UITapGestureRecognizer()            //收起键盘的手势
    private let searchBar = UISearchBar.init()
    private var textFieldInsideSearchBar = UITextField()
    
    @objc let tableView = UITableView.init()
    var model = KJHomeModel()
    
     // MARK: - Cycle Life
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.initNavigationBar()
        self.initData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - init View
    @objc func initNavigationBar() {
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage().getImageWithColor(color: kThemeBlockColor), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage().getImageWithColor(color: kThemeBlockColor)
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.barTintColor = kThemeBlockColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: kTextNormalColor]
        self.navigationItem.title = "KJHomeNavigationTitle".localized

        let leftItem = UIBarButtonItem(image:UIImage(named:"ic_menu_gray"), style:UIBarButtonItemStyle.plain, target:self, action:#selector(leftButtonDidClicked))
        leftItem.tintColor = kTextNormalColor
        let rightItem = UIBarButtonItem(image:UIImage(named:"ic_add_green"), style:UIBarButtonItemStyle.plain, target:self, action:#selector(rightButtonDidClicked))
        rightItem.tintColor = kThemeGreenColor
        
        self.navigationItem.leftBarButtonItem = leftItem
        self.navigationItem.rightBarButtonItem = rightItem
        
        
    }
    
    @objc func setupView() {
        
        
        searchBar.backgroundImage = UIImage().getImageWithColor(color: kThemeBlockColor)
        textFieldInsideSearchBar = (searchBar.value(forKey: "searchField") as? UITextField)!
        textFieldInsideSearchBar.backgroundColor = kThemeBackgroundColor
        textFieldInsideSearchBar.textColor = kTextNormalColor
        
        handleGesture.addTarget(self, action: #selector(handleTap(sender:)))
        self.view.addGestureRecognizer(handleGesture)
        
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
    
    // to testUI,would delete this func
    @objc func initData() {
        model = KJSecurityKit.sharedInstance.queryAllPasswordBox()
        tableView.reloadData()
    }
    
    // MARK: - Event
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            textFieldInsideSearchBar.resignFirstResponder()
        }
        sender.cancelsTouchesInView = false
    }
    
    @objc func leftButtonDidClicked() {

        skiddingButtonStatus = !skiddingButtonStatus
        
        if skiddingButtonStatus {

            self.view.removeGestureRecognizer(handleGesture)
            skiddingVC.view.frame = CGRect(x:0,y:0,width:(kScreenWidth * 2 / 3),height:kScreenHeight)
            maskedGesture.addTarget(self, action: #selector(maskedGestureDidClicked))
            self.tabBarController?.view.addGestureRecognizer(maskedGesture)
            self.tabBarController?.view.superview?.addSubview(skiddingVC.view)

            let ani = CABasicAnimation(keyPath: "position.x")
            ani.fromValue = -(kScreenWidth / 3)
            ani.toValue = (kScreenWidth  / 3)
            ani.duration = kSkiddingViewAnimationTime
            ani.isRemovedOnCompletion = false
            ani.fillMode = kCAFillModeForwards
            ani.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            self.skiddingVC.view.layer.add(ani, forKey: "animationSkid")
            
            let anim = CABasicAnimation(keyPath: "position.x")
            anim.fromValue = (kScreenWidth / 2)
            anim.toValue = (kScreenWidth * 2 / 3) + (kScreenWidth / 2)
            anim.duration = kSkiddingViewAnimationTime
            anim.isRemovedOnCompletion = false
            anim.fillMode = kCAFillModeForwards
            anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            self.tabBarController?.view.layer.add(anim, forKey: "animationTabBar")

        }
    }
    
    @objc func maskedGestureDidClicked() {
        
        skiddingButtonStatus = !skiddingButtonStatus
        self.view.addGestureRecognizer(handleGesture)
        self.tabBarController?.view.removeGestureRecognizer(maskedGesture)

        let ani = CABasicAnimation(keyPath: "position.x")
        ani.fromValue = (kScreenWidth / 3)
        ani.toValue = -(kScreenWidth / 3)
        ani.duration = kSkiddingViewAnimationTime
        ani.isRemovedOnCompletion = false
        ani.fillMode = kCAFillModeForwards
        ani.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        self.skiddingVC.view.layer.add(ani, forKey: "animationSkidBack")
        
        let anim = CABasicAnimation(keyPath: "position.x")
        anim.fromValue = (kScreenWidth * 2 / 3) + (kScreenWidth / 2)
        anim.toValue = (kScreenWidth / 2)
        anim.duration = kSkiddingViewAnimationTime
        anim.isRemovedOnCompletion = false
        anim.fillMode = kCAFillModeForwards
        anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        self.tabBarController?.view.layer.add(anim, forKey: "animationTabBarBack")
        
        _ = KJCommonFunc.delay(kSkiddingViewAnimationTime, task: {
            self.skiddingVC.view.removeFromSuperview()
        })
    }
    
    @objc func rightButtonDidClicked() {
        let addVC = KJAddController()
        addVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(addVC, animated: true)
    }
}

extension KJHomeController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.viewModelList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        weak var weakSelf = self
        let cell = KJHomeCell.init(style: UITableViewCellStyle.default, reuseIdentifier: homeCellIdentifier)
        let tempModel = model.viewModelList[indexPath.row]
        cell.updateHomeCellWithModel(tempModel, { [weak self] (status) -> Void in
            tempModel.expandStatus = status
            self?.tableView.reloadData()
        })
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
        let tempModel = model.viewModelList[indexPath.row]
        if tempModel.expandStatus {
            return 150.0
        } else {
            return 75.0
        }
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
    
        let tempModel = model.viewModelList[indexPath.row]
        let delete = UITableViewRowAction(style: .normal, title: "KJHomeDeleteButtton".localized) { [weak self]
            action, index in
            self?.model.viewModelList.remove(at: index.row)
            KJSecurityKit.sharedInstance.deletePasswordBox(PasswordBox: tempModel.passwordBox)
//            KJSecurityKit.sharedInstance.deleteAllPasswordBox()
            tableView.reloadData()
        }
        delete.backgroundColor = kThemeGreenColor
        return [delete]
        
    }
}

