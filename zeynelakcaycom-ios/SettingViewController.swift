//
//  SettingViewController.swift
//  zeynelakcaycom-ios
//
//  Created by Zeynel Akçay on 16.02.2019.
//  Copyright © 2019 Zeynel Akçay. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet var settingTabBarItem: UITabBarItem!
    override func viewDidLoad() {
        super.viewDidLoad()
settingTabBarItem.selectedImage = tabBarItem.selectedImage?.withRenderingMode(.alwaysOriginal)
    }

}
