//
//  KJAddRoutineCell.swift
//  WiPassword
//
//  Created by Huni on 30/08/2017.
//  Copyright © 2017 KnighhtJoker. All rights reserved.
//

import UIKit

let addRoutineCellIdentifier = "KJAddRoutineCellIdentifier"

enum KJAddRoutineCellType : Int {
    
    case defaultCell                //默认输入框类型
    case switchCell                 //开关类型
    case sliderCell                 //滑动类型
    
}

class KJAddRoutineCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configCell(Type type:KJAddRoutineCellType, Title title:String) {
        self.backgroundColor = kThemeBlockColor
    }
}
