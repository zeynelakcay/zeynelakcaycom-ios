//
//  ArticleDetailViewController.swift
//  zeynelakcaycom-ios
//
//  Created by Zeynel Akçay on 16.03.2019.
//  Copyright © 2019 Zeynel Akçay. All rights reserved.
//

import UIKit
import WebKit

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}

class ArticleDetailViewController: UIViewController,WKUIDelegate {
    
    var articleId:String = ""
    var articleContent:String = ""
    var webView: WKWebView!
    
    @IBOutlet var articleDetailTextView: UITextView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "http://zeynelakcay.com/api/post/article/"+self.articleId)

        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            } else {
                
                if data != nil {
                    
                    do {
                        
                        let jSONResultDictionary:NSDictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                        self.articleContent = jSONResultDictionary["content"] as! String
                        //for i in 0..<jSONResultArray.count
                        //{
                            //let jSONResultDic = jSONResultArray[i] as! Dictionary<String,AnyObject>
                            //print(jSONResultDic)
                            //self.articleTitles.append(jSONResultDic["title"]! as! String)
                            //self.articleId.append(jSONResultDic["post_id"]! as! String)
                            //self.articleAuthors.append(jSONResultDic["author"]! as! String)
                        //}
                        DispatchQueue.main.async {
                            self.webView.loadHTMLString(self.articleContent, baseURL:nil)
                            //self.articleDetailTextView.attributedText = self.articleContent.htmlToAttributedString
                        }
                        
                    } catch {
                        
                    }
                    
                }
                
                
            }
            
            
        }
        task.resume()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
