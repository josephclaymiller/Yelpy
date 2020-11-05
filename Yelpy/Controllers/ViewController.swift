//
//  ViewController.swift
//  Yelpy
//
//  Created by Joseph Miller on 11/5/20.
//

import UIKit
import AlamofireImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var resturantsArray: [[String: Any]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        setRestaurants()
    }
    
    func setRestaurants() {
        API.getRestaurants() { (resturants) in
            guard let restaurants = resturants else {
                print("No restaurants")
                return
            }
            self.resturantsArray = restaurants
            self.tableView.reloadData()
        }
    }

    // MARK: Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resturantsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let restaurant = Restaurant(data: resturantsArray[indexPath.row])
        let restaurantViewModel = RestaurantViewModel(data: restaurant)
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell") as! RestaurantCell
        cell.nameLabel.text = restaurantViewModel.name
        cell.categoryLabel.text = restaurantViewModel.category
        if let reviews = restaurantViewModel.reviews {
            cell.reviewsLabel.text = String(reviews)
        }
        cell.phoneLabel.text = restaurantViewModel.phone
        if let imageUrlStirng = restaurantViewModel.imageString {
            let imageUrl = URL(string: imageUrlStirng)
            cell.restaurantImageView.af.setImage(withURL: imageUrl!)
        }
        cell.starsImageView.image = UIImage(named: restaurantViewModel.starImageName)
        return cell
    }
    

}

