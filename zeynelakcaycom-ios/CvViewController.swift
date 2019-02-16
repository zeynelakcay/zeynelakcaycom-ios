//
//  SecondViewController.swift
//  zeynelakcaycom-ios
//
//  Created by Zeynel Akçay on 16.02.2019.
//  Copyright © 2019 Zeynel Akçay. All rights reserved.
//

import UIKit

class CvViewController: UIViewController {

    @IBOutlet var cvTabBarItem: UITabBarItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        cvTabBarItem.selectedImage = tabBarItem.selectedImage?.withRenderingMode(.alwaysOriginal)

        
    }


}

