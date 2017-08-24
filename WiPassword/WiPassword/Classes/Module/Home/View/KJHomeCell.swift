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
        
        let iconImageView = UIImageView.init(image: UIImage(named:""))
        iconImageView.layer.cornerRadius = 30                           //Todo这里需要计算icon大小
        self.addSubview(iconImageView)
        
        iconImageView.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(self)
            make.left.equalTo(self)
            make.width.height.equalTo(50)
        }
        
        let titleLabel = UILabel()
        titleLabel.text = model.title
        titleLabel.textColor = kThemeGreenColor
        titleLabel.font = kFont14
        
        self.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(iconImageView)
            make.left.equalTo(iconImageView.snp.right).offset(10)
        }
        
        let userLabel = UILabel()
        userLabel.text = model.username
        userLabel.textColor = kTextNormalColor
        userLabel.font = kFont12
        
        self.addSubview(userLabel)
        
        userLabel.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(iconImageView)
            make.left.equalTo(titleLabel.snp.left)
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


}
