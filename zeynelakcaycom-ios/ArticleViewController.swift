//
//  FirstViewController.swift
//  zeynelakcaycom-ios
//
//  Created by Zeynel Akçay on 16.02.2019.
//  Copyright © 2019 Zeynel Akçay. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {

    @IBOutlet var articleTabBarItem: UITabBarItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        articleTabBarItem.selectedImage = tabBarItem.selectedImage?.withRenderingMode(.alwaysOriginal)

    }


}

