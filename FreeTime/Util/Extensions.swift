//
//  Extensions.swift
//  FreeTime
//
//  Created by Mohamed Ibrahim on 04/12/2018.
//  Copyright © 2018 OriginLines. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialSnackbar

protocol Alertable {}
extension Alertable where Self: UIViewController {
    func alert(title:String, msg:String, type: UIColor = .black, disableTime: Double, handler: (()->())? = nil){
        let height = self.view.safeAreaInsets.bottom
        let offSet = (self.tabBarController?.tabBar.frame.size.height ?? height) + height
        let view = MDCSnackbarMessageView.appearance()
        view.snackbarMessageViewBackgroundColor = .black
        let font = UIFont.systemFont(ofSize: 16, weight: .regular)
        view.messageFont = font
        let message = MDCSnackbarMessage()
        message.text = msg
        MDCSnackbarManager.alignment = .center
        MDCSnackbarManager.setBottomOffset(offSet)
        MDCSnackbarManager.show(message)
    }
}
