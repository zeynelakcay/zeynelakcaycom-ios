//
//  SecondViewController.swift
//  zeynelakcaycom-ios
//
//  Created by Zeynel Akçay on 16.02.2019.
//  Copyright © 2019 Zeynel Akçay. All rights reserved.
//

import UIKit
import WebKit

class CvViewController: UIViewController,WKUIDelegate {

    @IBOutlet var cvTabBarItem: UITabBarItem!
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        cvTabBarItem.selectedImage = tabBarItem.selectedImage?.withRenderingMode(.alwaysOriginal)
        let myURL = URL(string:"http://cv.zeynelakcay.com/")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
    }


}

