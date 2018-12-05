//
//  MainTabBarController.swift
//  FreeTime
//
//  Created by Mohamed Ibrahim on 04/12/2018.
//  Copyright © 2018 OriginLines. All rights reserved.
//

import UIKit
import FirebaseAuth

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = [UINavigationController(rootViewController: IntialViewController())]
        if Auth.auth().currentUser == nil {
            signInUserAnnoymously()
        }
    }
    
    fileprivate func signInUserAnnoymously() {
        Auth.auth().signInAnonymously() { [weak self] (authResult, error) in
            guard let self = self else {return}
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let _ = authResult?.user else {return}
            self.alert(title: "", msg: "Signed in anonymously", disableTime: 3)
        }
    }
}

extension MainTabBarController: Alertable {}
