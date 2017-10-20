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
    case imageHeaderCell            //左侧带图片的类型
    case remarkCell                 //备注类型
    
}

class KJAddRoutineCell: UITableViewCell,UITextFieldDelegate,UITextViewDelegate {
    
    private let titleLabel = UILabel()
    private let slider = UISlider()
    private let sliderLabel = UILabel()
    private let textField = UITextField()
    private let switchButton = UISwitch()

    @objc var switchIsOn : Bool = false
    
    typealias defaultTextFieldClosure = (_ text:String) -> Void
    typealias switchButtonClosure = (_ isOn:Bool) -> Void
    typealias sliderButtonClosure = (_ sliderValue:String) -> Void
    typealias defaultTextViewClosure = (_ text:String) -> Void
    
    @objc var switchClosure: switchButtonClosure?
    @objc var sliderClosure: sliderButtonClosure?
    @objc var textFieldClosure: defaultTextFieldClosure?
    @objc var textViewClosure: defaultTextViewClosure?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK: - config Cell
    @objc func setTextField(Text text:String, PlaceHolder placeHolder:String,SecureTextEntry isSecureTextEntry:Bool) {
        textField.isSecureTextEntry = isSecureTextEntry
        textField.text = text
        textField.attributedPlaceholder = NSAttributedString(string:placeHolder,
                                                             attributes:[NSAttributedStringKey.foregroundColor:kLineViewColor])
    }
    
    func configCell(Type type:KJAddRoutineCellType, Title title:String) {
        
        self.selectionStyle = .none
        self.backgroundColor = kThemeBlockColor
        titleLabel.text = title
        titleLabel.textColor = kLineViewColor
        titleLabel.font = kFont14
        
        self.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints {  (make) -> Void in
            make.centerY.equalTo(self)
            make.left.equalTo(15)
            make.width.equalTo(65)
        }
        
        switch type {
        case KJAddRoutineCellType.defaultCell:
            self.setupCellWithDefaultType()
        case KJAddRoutineCellType.switchCell:
            self.setupCellWithSwitchType()
        case KJAddRoutineCellType.sliderCell:
            self.setupCellWithSliderCell()
        case KJAddRoutineCellType.imageHeaderCell:
            self.setupCellWithImageHeaderCell()
        case KJAddRoutineCellType.remarkCell:
            self.setupCellWithRemarkCell()
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
    
    private func setupCellWithDefaultType() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(editEnd), name: Notification.Name(rawValue: kAddEditEndNotification), object: nil)
        textField.textColor = kTextNormalColor
        textField.font = kFont14
        textField.delegate = self
        
        self.addSubview(textField)
        
        textField.snp.makeConstraints {  (make) -> Void in
            make.centerY.equalTo(self)
            make.left.equalTo(titleLabel.snp.right).offset(2)
            make.right.equalTo(-50)
            make.height.equalTo(self)
        }
        
    }
    
    private func setupCellWithSwitchType() {
        
        
        switchButton.onTintColor = kThemeGreenColor
        switchButton.thumbTintColor = kLineViewColor
        switchButton.tintColor = kLineViewColor
        switchButton.setOn(switchIsOn, animated: false)
        switchButton.layer.cornerRadius = 1.0
        switchButton.addTarget(self, action: #selector(switchButtonValueChanged), for: UIControlEvents.valueChanged)
        self.addSubview(switchButton)
        
        switchButton.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(self)
            make.right.equalTo(-15)
        }
    }
    
    private func setupCellWithSliderCell() {
        
        slider.minimumValue = 0
        slider.maximumValue = 20
        slider.value = 0
        slider.thumbTintColor = kTextNormalColor                        // 设置圆点颜色
        slider.minimumTrackTintColor = kThemeGreenColor                 // 设置滑动过的颜色
        slider.maximumTrackTintColor = kLineViewColor                   // 设置未滑动过的颜色
        slider.addTarget(self, action: #selector(sliderValueChanged(slider:)), for: UIControlEvents.valueChanged)
        
        sliderLabel.textColor = kLineViewColor
        sliderLabel.font = kFont14
        sliderLabel.text = "0"
        
        self.addSubview(slider)
        self.addSubview(sliderLabel)
        
        slider.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(self)
            make.left.equalTo(titleLabel.snp.right).offset(10)
            make.right.equalTo(-50)
            make.height.equalTo(self)
        }
        
        sliderLabel.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(self)
            make.right.equalTo(-15)
        }
        
    }
    
    private func setupCellWithImageHeaderCell() {
        NotificationCenter.default.addObserver(self, selector: #selector(editEnd), name: Notification.Name(rawValue: kAddEditEndNotification), object: nil)
        titleLabel.removeFromSuperview()
        
        let imageButton = UIButton()
        imageButton.setImage(UIImage(named:"ic_password_white"), for: UIControlState.normal)
        imageButton.contentMode = .scaleAspectFit
        imageButton.backgroundColor = kThemeGreenColor
        
        self.addSubview(imageButton)
        imageButton.addTarget(self, action: #selector(imageButtonDidClicked), for: UIControlEvents.touchUpInside)
        
        imageButton.snp.makeConstraints {  (make) -> Void in
            make.centerY.equalTo(self)
            make.left.equalTo(0)
            make.width.equalTo(80)
            make.height.equalTo(self)
        }
        
        textField.textColor = kTextNormalColor
        textField.font = kFont18
        textField.text = "账户信息"
        textField.delegate = self
        
        self.addSubview(textField)
        
        textField.snp.makeConstraints {  (make) -> Void in
            make.centerY.equalTo(self)
            make.left.equalTo(imageButton.snp.right).offset(10)
            make.right.equalTo(-50)
            make.height.equalTo(self)
        }
        
        let imageView = UIImageView.init(image: UIImage(named:"ic_edit_gray"))
        
        self.addSubview(imageView)
        
        imageView.snp.makeConstraints {  (make) -> Void in
            make.centerY.equalTo(self)
            make.right.equalTo(-15)
            make.height.width.equalTo(22.5)
        }
    }
    
    private func setupCellWithRemarkCell() {
    
        NotificationCenter.default.addObserver(self, selector: #selector(editEnd), name: Notification.Name(rawValue: kAddEditEndNotification), object: nil)
        titleLabel.snp.updateConstraints { (make) -> Void in
            make.centerY.equalTo(self).offset(-15)
        }
        
        let textView = UITextView()
        textView.backgroundColor = kThemeBlockColor
        textView.textColor = kTextNormalColor
        textView.font = kFont14
        textView.delegate = self;
        textView.textAlignment = .left
        
        self.addSubview(textView)
        
        textView.snp.makeConstraints {  (make) -> Void in
            make.centerY.equalTo(self)
            make.left.equalTo(titleLabel.snp.right)
            make.right.equalTo(-15)
            make.height.equalTo(self)
        }
        
    }
    
    // MARK: - textFieldDelegate
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (textFieldClosure != nil) {
            textFieldClosure!(textField.text!)
        }
    }
    
    // MARK: - textViewDelegate
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if (textViewClosure != nil) {
            textViewClosure!(textView.text)
        }
    }
    
    // MARK: - events

    @objc func sliderValueChanged(slider:UISlider) {
        sliderLabel.text = String(Int(slider.value))
        if (sliderClosure != nil) {
            sliderClosure!(String().randomPass(Length: Int(slider.value)))
        }
    }
    
    @objc func switchButtonValueChanged(sender:UISwitch) {
        if (switchClosure != nil) {
            switchClosure!(sender.isOn)
        }
    }
    
    @objc func imageButtonDidClicked() {
        print("点击")
    }
    
    // MARK: - notification
    @objc func editEnd() {
        self.endEditing(true)
    }
}
