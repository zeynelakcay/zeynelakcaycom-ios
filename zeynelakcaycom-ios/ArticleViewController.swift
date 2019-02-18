//
//  FirstViewController.swift
//  zeynelakcaycom-ios
//
//  Created by Zeynel Akçay on 16.02.2019.
//  Copyright © 2019 Zeynel Akçay. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    
    var nameFood = ["Chicken Spicy","Burger Extra Keju", "Ayam Goreng", "Bebek goreng", "Ayam Bakar Paket", "Ayam Geprek", "Nasi Telur"]
    var placeName = ["Super Sambal","McD Jombor", "KFC Sudirman", "Bu Bibit", "Ayam Penyet Suroboyo","Pak Kobis","Burjo Putra sunda"]
    var price = ["Rp. 25.000","Rp. 34.000", "Rp.31.000", "Rp. 26.000", "Rp. 24.000", "Rp. 22.000","Rp. 10.000"]
    var imageStore = ["barrafina","barrafina","bourkestreetbakery","cafedeadend", "cafeloisl","caskpubkitchen","caskpubkitchen"]
    
    @IBOutlet var articleTableView: UITableView!
    @IBOutlet var articleTabBarItem: UITabBarItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        articleTabBarItem.selectedImage = tabBarItem.selectedImage?.withRenderingMode(.alwaysOriginal)
        articleTableView.dataSource = self
        articleTableView.delegate = self

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameFood.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentification = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentification, for: indexPath) as! ArticleTableViewCell
        //configuration cell
        cell.foodName.text = nameFood[indexPath.row]
        cell.priceFood.text = price[indexPath.row]
        cell.locationStore.text = placeName[indexPath.row]
        cell.foodImageView.image = UIImage(named: imageStore[indexPath.row])
        
        //Circular Image
        //cell.foodImageView.layer.cornerRadius = 25.0
        //cell.foodImageView.clipsToBounds = true
        return cell
    }


}

