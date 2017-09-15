//
//  KJSettingRoutineCell.swift
//  WiPassword
//
//  Created by Huni on 25/08/2017.
//  Copyright © 2017 KnighhtJoker. All rights reserved.
//

import UIKit

enum KJSettingRoutineCellType : Int {
    
    case defaultCell                //默认右边带箭头
    case switchCell                 //开关类型
    
}

let settingRoutineCellIdentifier = "KJSettingRoutineCellIdentifier"

class KJSettingRoutineCell: UITableViewCell {
    
    private let switchButton = UISwitch()
    
    typealias switchButtonClosure = (_ isOn:Bool) -> Void
    var switchClosure: switchButtonClosure?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setSwithButtonIsOn(_ isOn:Bool) {
        switchButton.isOn = isOn
    }
    
    func configCell(Icon icon:UIImage,Title title:String,Type type:KJSettingRoutineCellType) {
        
        self.backgroundColor = kThemeBackgroundColor
       
        let iconImageView = UIImageView.init(image: icon)
        iconImageView.contentMode = .scaleAspectFit
        
        self.addSubview(iconImageView)
        
        iconImageView.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(self)
            make.left.equalTo(15)
            make.width.height.equalTo(25)
        }
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = kTextNormalColor
        titleLabel.font = kFont16
        
        self.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(self)
            make.left.equalTo(iconImageView.snp.right).offset(10)
        }
        
        switch type {
        case KJSettingRoutineCellType.defaultCell:
            
            let arrowImageView = UIImageView.init(image: UIImage(named:"ic_arrow_gray"))
            arrowImageView.contentMode = .scaleAspectFit
            self.addSubview(arrowImageView)
            arrowImageView.snp.makeConstraints { (make) -> Void in
                make.centerY.equalTo(self)
                make.right.equalTo(-15)
                make.width.height.equalTo(10)
            }
            
        default:
            self.selectionStyle = .none

            switchButton.onTintColor = kThemeGreenColor
            switchButton.thumbTintColor = kTextNormalColor
            switchButton.tintColor = kLineViewColor
            switchButton.layer.cornerRadius = 1.0
            switchButton.addTarget(self, action: #selector(switchButtonValueChanged), for: UIControlEvents.valueChanged)
            self.addSubview(switchButton)
            switchButton.snp.makeConstraints { (make) -> Void in
                make.centerY.equalTo(self)
                make.right.equalTo(-15)
            }
            
        }
        
        let lineView = UIView()
        lineView.backgroundColor = kThemeBlockColor
        
        self.addSubview(lineView)
        
        lineView.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(self)
            make.left.equalTo(self)
            make.width.equalTo(self)
            make.height.equalTo(3)
        }
        
    }
    
    // MARK : events

    func switchButtonValueChanged(sender:UISwitch) {
       
        if (switchClosure != nil) {
            switchClosure!(sender.isOn)
        }
    }

}
