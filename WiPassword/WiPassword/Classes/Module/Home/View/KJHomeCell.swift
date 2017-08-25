//
//  KJHomeCell.swift
//  WiPassword
//
//  Created by Huni on 24/08/2017.
//  Copyright © 2017 KnighhtJoker. All rights reserved.
//

import UIKit

let homeCellIdentifier = "KJHomeCellIdentifier"

class KJHomeCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func updateHomeCellWithModel(_ model : KJHomeViewModel) {
        
        self.backgroundColor = kThemeBlockColor
        let iconImageView = UIImageView.init()
        switch model.passType {
        case KJHomePasswordType.account:
            iconImageView.image = UIImage(named:"ic_password_gray")
        case KJHomePasswordType.mail:
            iconImageView.image = UIImage(named:"ic_email_gray")
        case KJHomePasswordType.message:
            iconImageView.image = UIImage(named:"ic_message_gray")
        default:
            iconImageView.image = UIImage(named:"ic_star_gray")
        }
        
        iconImageView.contentMode = .scaleAspectFit
     
        let iconView = UIView()
        iconView.backgroundColor = kThemeBackgroundColor
        iconView.layer.cornerRadius = 25
        
        self.addSubview(iconView)
        iconView.addSubview(iconImageView)
        
        iconView.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(self)
            make.left.equalTo(self).offset(15)
            make.width.height.equalTo(50)
        }
        
        iconImageView.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(iconView)
            make.centerX.equalTo(iconView)
            make.width.height.equalTo(25)
        }
        
        let titleLabel = UILabel()
        titleLabel.text = model.title
        titleLabel.textColor = kThemeGreenColor
        titleLabel.font = kFont16
        
        self.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(iconView).offset(4)
            make.left.equalTo(iconView.snp.right).offset(10)
        }
        
        let userLabel = UILabel()
        userLabel.text = model.username
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
        statusButton.addTarget(self, action: #selector(statusButtonDidClicked), for: UIControlEvents.touchUpInside)
        self.addSubview(statusButton)
        
        statusButton.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(self)
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
    }


    // MARK: events
    func statusButtonDidClicked() {
        print("打开")
    }
}
