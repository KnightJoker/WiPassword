//
//  KJAlertController.swift
//  WiPassword
//
//  Created by Huni on 14/09/2017.
//  Copyright © 2017 KnighhtJoker. All rights reserved.
//

import UIKit

class KJAlertController: UIAlertController {
    
    typealias leftButtonClosure = ((UIAlertAction) -> Swift.Void)
    typealias rightButtonClosure = ((UIAlertAction) -> Swift.Void)
    
    var leftButtonDidClickClosure : leftButtonClosure?
    var rightButtonDidClickClosure : rightButtonClosure?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        leftButtonDidClickClosure = leftButtonClosure()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func addAction(_ action: UIAlertAction) {
        super.addAction(action)
        action.setValue(kThemeGreenColor, forKey:"titleTextColor")
    }
 

    // MARK - public
     func presentAlertController(Controller vc:UIViewController,Title title:String,Message message:String,LeftButtonText leftText:String,RightButtonText rightText:String,LeftButtonClosure leftClosure:leftButtonClosure?,RightButtonClosure rightClosure:rightButtonClosure?) {
        
        let uiAlert = KJAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        vc.present(uiAlert, animated: true, completion: nil)
        
        uiAlert.addAction(UIAlertAction(title: rightText, style: .default, handler: rightClosure))
        
        uiAlert.addAction(UIAlertAction(title: leftText, style: .cancel, handler: leftClosure))
    }
}
