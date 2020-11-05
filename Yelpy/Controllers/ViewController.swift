//
//  ViewController.swift
//  Yelpy
//
//  Created by Joseph Miller on 11/5/20.
//

import UIKit

class ViewController: UIViewController {
    
    var resturantsArray: [[String: Any]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Get Restaurants")
        setResturants()
    }
    
    func setResturants() {
        API.getRestaurants() { (resturants) in
            guard let resturants = resturants else {
                print("No resturants")
                return
            }
            self.resturantsArray = resturants
            // TODO: Reload data in view to show resturants
        }
    }


}

