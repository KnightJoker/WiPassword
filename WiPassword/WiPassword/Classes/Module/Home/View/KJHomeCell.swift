//
//  KJHomeCell.swift
//  WiPassword
//
//  Created by Huni on 24/08/2017.
//  Copyright © 2017 KnighhtJoker. All rights reserved.
//

import UIKit

let homeCellIdentifier = "KJHomeCellIdentifier"
private var status = false

class KJHomeCell: UITableViewCell {
    
    typealias statusButtonClosure = (_ status:Bool) -> Void
    
    var _statusClosure: statusButtonClosure?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func updateHomeCellWithModel(_ model : KJHomeViewModel,_ statusClosure:@escaping statusButtonClosure) {
        
        _statusClosure = statusClosure
        
        self.backgroundColor = kThemeBlockColor
        let iconImageView = UIImageView.init()
        switch model.passType {
        case KJHomePasswordType.account:
            iconImageView.image = UIImage(named:"ic_star_gray")
        case KJHomePasswordType.mail:
            iconImageView.image = UIImage(named:"ic_email_gray")
        case KJHomePasswordType.message:
            iconImageView.image = UIImage(named:"ic_message_gray")
        default:
            iconImageView.image = UIImage(named:"ic_password_gray")
        }
        
        iconImageView.contentMode = .scaleAspectFit
     
        let iconView = UIView()
        iconView.backgroundColor = kThemeBackgroundColor
        iconView.layer.cornerRadius = 25
        
        self.addSubview(iconView)
        iconView.addSubview(iconImageView)
        
        iconView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self).offset(15)
            make.left.equalTo(self).offset(15)
            make.width.height.equalTo(50)
        }
        
        iconImageView.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(iconView)
            make.centerX.equalTo(iconView)
            make.width.height.equalTo(25)
        }
        
        let titleLabel = UILabel()
        titleLabel.text = model.passwordBox.title
        titleLabel.textColor = kThemeGreenColor
        titleLabel.font = kFont16
        
        self.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(iconView).offset(4)
            make.left.equalTo(iconView.snp.right).offset(10)
        }
        
        let userLabel = UILabel()
        userLabel.text = model.passwordBox.username
        userLabel.textColor = kTextNormalColor
        userLabel.font = kFont14
        
        self.addSubview(userLabel)
        
        userLabel.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(iconView).offset(-4)
            make.left.equalTo(titleLabel.snp.left)
        }
        
        let statusButton = UIButton.init()
        statusButton.contentMode = .scaleAspectFit
        statusButton.setImage(UIImage(named:"ic_moreDown_gray"), for: UIControlState.normal)
        statusButton.addTarget(self, action: #selector(statusButtonDidClicked(_:)), for: UIControlEvents.touchUpInside)
        self.addSubview(statusButton)
        
        statusButton.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(iconView)
            make.right.equalTo(-15)
            make.width.height.equalTo(20)
        }
        
        let lineView = UIView()
        lineView.backgroundColor = kThemeBackgroundColor
        
        self.addSubview(lineView)
        
        lineView.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(self)
            make.left.equalTo(self)
            make.width.equalTo(self)
            make.height.equalTo(3)
        }
        
        let passGroundView = UIView()
        let passLabel = UILabel()
        let passStrengthView = UIView()
        let passStrengthLabel = UILabel()
        let passView = UIView()
        
        
        if model.expandStatus {
            
            passGroundView.backgroundColor = kThemeBackgroundColor
            self.addSubview(passGroundView)
            passGroundView.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(userLabel.snp.bottom).offset(10)
                make.left.equalTo(iconView.snp.left)
                make.right.equalTo(statusButton.snp.right)
                make.height.equalTo(35)
            }
            
            passLabel.textColor = kTextNormalColor
            passLabel.font = kFont14
            passLabel.text = "当前密码:" + model.passwordBox.password
            passGroundView.addSubview(passLabel)
            passLabel.snp.makeConstraints { (make) -> Void in
                make.left.equalTo(10)
                make.centerY.equalTo(passGroundView)
            }
        
            passStrengthView.backgroundColor = kThemeBackgroundColor
            self.addSubview(passStrengthView)
            passStrengthView.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(passGroundView.snp.bottom).offset(4)
                make.left.equalTo(iconView.snp.left)
                make.right.equalTo(statusButton.snp.right)
                make.height.equalTo(25)
            }
            
            // Todo 判断密码强度
            
            passStrengthLabel.textColor = kTextNormalColor
            passStrengthLabel.font = kFont12
//            passStrengthLabel.text = "较强"
            
            passView.layer.cornerRadius = 4
            passStrengthView.addSubview(passStrengthLabel)
            passStrengthView.addSubview(passView)
            
            passView.snp.makeConstraints { (make) -> Void in
                make.left.equalTo(0)
                make.centerY.equalTo(passStrengthView)
                make.height.equalTo(passStrengthView)
                make.width.equalTo(0)
            }
            
            passStrengthLabel.snp.makeConstraints { (make) -> Void in
                make.right.equalTo(-4)
                make.centerY.equalTo(passStrengthView)
            }
            
            if String().judgeComplexity(model.passwordBox.password) == 0 {
                passStrengthLabel.text = "弱"
                passView.backgroundColor = kThemeRedColor
                passView.snp.updateConstraints { (make) -> Void in
                    make.width.equalTo(kScreenWidth / 5)
                }
            } else if String().judgeComplexity(model.passwordBox.password) == 1 {
                passStrengthLabel.text = "较强"
                passView.backgroundColor = kThemeOrangleColor
                passView.snp.updateConstraints { (make) -> Void in
                    make.width.equalTo(kScreenWidth * 2 / 5)
                }
            } else {
                passStrengthLabel.text = "强"
                passView.backgroundColor = kThemeGreenColor
                passView.snp.updateConstraints { (make) -> Void in
                    make.width.equalTo(kScreenWidth * 3 / 5)
                }
            }
            
        } else {
            passGroundView.removeFromSuperview()
            passLabel.removeFromSuperview()
            passStrengthView.removeFromSuperview()
            passStrengthLabel.removeFromSuperview()
            passView.removeFromSuperview()
        }
    }
    
    // MARK: events
    func statusButtonDidClicked(_ button:UIButton) {
        status = !status
        if (_statusClosure != nil) {
            _statusClosure!(status)
        }
    }
}
