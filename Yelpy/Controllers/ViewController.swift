//
//  ViewController.swift
//  Yelpy
//
//  Created by Joseph Miller on 11/5/20.
//

import UIKit

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
        let cell = UITableViewCell()
        cell.textLabel?.text = restaurant.name
        return cell
    }
    

}

