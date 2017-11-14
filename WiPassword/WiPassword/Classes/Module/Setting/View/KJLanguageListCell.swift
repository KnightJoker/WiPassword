//
//  KJLanguageListCell.swift
//  WiPassword
//
//  Created by Huni on 14/11/2017.
//  Copyright © 2017 KnighhtJoker. All rights reserved.
//

import UIKit

let languageListCellIdentifier = "KJLanguageListCellIdentifier"

class KJLanguageListCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    func configCell(Title title:String,IsSelect select:Bool) {
        self.backgroundColor = kThemeBlockColor
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = kTextNormalColor
        titleLabel.font = kFont16
        
        self.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(self)
            make.left.equalTo(15)
        }
        
        if select {
            let iconImageView = UIImageView.init(image: UIImage(named:"ic_selected_green")!)
            iconImageView.contentMode = .scaleAspectFit
            
            self.addSubview(iconImageView)
            
            iconImageView.snp.makeConstraints { (make) -> Void in
                make.centerY.equalTo(self)
                make.right.equalTo(-15)
                make.width.height.equalTo(15)
            }
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
