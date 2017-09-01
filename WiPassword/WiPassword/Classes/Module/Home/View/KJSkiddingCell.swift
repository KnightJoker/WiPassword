//
//  KJSkddingCell.swift
//  WiPassword
//
//  Created by Huni on 01/09/2017.
//  Copyright © 2017 KnighhtJoker. All rights reserved.
//

import UIKit

let skiddingCellIdentifier = "KJSkiddingCellIdentifier"

class KJSkiddingCell: UITableViewCell {

    
    private let titleLabel = UILabel()
    private let titleImage = UIImageView()
    private var titleImageString = String()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(Image image:String,Title title:String) {
        
        self.backgroundColor = kThemeDeepBlockColor
        self.selectionStyle = .none
        titleLabel.text = title
        titleLabel.font = kFont16
        titleLabel.textColor = kLineViewColor
        
        self.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(self)
            make.centerX.equalTo(self)
        }
        
        titleImageString = image
        titleImage.image = UIImage(named:image + "_gray")
        titleImage.contentMode = .scaleAspectFit
        
        self.addSubview(titleImage)
        
        titleImage.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(self)
            make.right.equalTo(titleLabel.snp.left).offset(-16)
            make.width.equalTo(25)
            make.height.equalTo(30)
        }
        
        
        let lineView = UIView()
        lineView.backgroundColor = kThemeBackgroundColor
        
        self.addSubview(lineView)
        
        lineView.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(self)
            make.left.equalTo(self)
            make.width.equalTo(self)
            make.height.equalTo(1)
        }
    }
    
    func selectCellStyle() {
        
        titleImage.image = UIImage(named:titleImageString + "_green")
        self.backgroundColor = kThemeBackgroundColor
        titleLabel.textColor = kTextNormalColor
        titleImage.tintColor = kThemeGreenColor
    }

}
