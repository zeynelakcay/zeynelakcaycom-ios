//
//  FirstViewController.swift
//  zeynelakcaycom-ios
//
//  Created by Zeynel Akçay on 16.02.2019.
//  Copyright © 2019 Zeynel Akçay. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    
    var articleTitles = [String]()
    var articleAuthors = [String]()
    var articleId = [String]()
    var selectedArticleId:String = ""
    var price = ["Rp. 25.000","Rp. 34.000", "Rp.31.000", "Rp. 26.000", "Rp. 24.000", "Rp. 22.000","Rp. 10.000"]
    var imageStore = ["barrafina","barrafina","bourkestreetbakery","cafedeadend", "cafeloisl","caskpubkitchen","caskpubkitchen"]
    
    @IBOutlet var articleTableView: UITableView!
    @IBOutlet var articleTabBarItem: UITabBarItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        articleTabBarItem.selectedImage = tabBarItem.selectedImage?.withRenderingMode(.alwaysOriginal)
        articleTableView.dataSource = self
        articleTableView.delegate = self
        
        let url = URL(string: "http://zeynelakcay.com/api/post/articles")
        
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
                        
                        let jSONResultArray:NSArray = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray

                            for i in 0..<jSONResultArray.count
                            {
                                let jSONResultDic = jSONResultArray[i] as! Dictionary<String,AnyObject>
                                self.articleTitles.append(jSONResultDic["title"]! as! String)
                                self.articleId.append(jSONResultDic["post_id"]! as! String)
                                self.articleAuthors.append(jSONResultDic["author"]! as! String)
                            }
                        DispatchQueue.main.async {
                            self.articleTableView.reloadData();
                        }
        
                    } catch {
                        
                    }
                    
                }
                
                
            }
            
            
        }
        task.resume()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentification = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentification, for: indexPath) as! ArticleTableViewCell
        //configuration cell
        
        let _ = self.articleId[indexPath.row]
        cell.foodName.text = self.articleTitles[indexPath.row]
        //cell.priceFood.text = price[indexPath.row]
        cell.locationStore.text = articleAuthors[indexPath.row]
        cell.foodImageView.image = UIImage(named: "https://api.adorable.io/avatars/285/abott@adorable.png")
        
        //Circular Image
        //cell.foodImageView.layer.cornerRadius = 25.0
        //cell.foodImageView.clipsToBounds = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedArticleId = self.articleId[indexPath.row]
        self.performSegue(withIdentifier: "ArticcleDetailVC", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ArticcleDetailVC" {
            let destinationVC = segue.destination as! ArticleDetailViewController
            destinationVC.articleId = self.selectedArticleId
        }
    }

}

