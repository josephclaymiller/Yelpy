//
//  Restaurant.swift
//  Yelpy
//
//  Created by Joseph Miller on 11/5/20.
//

import Foundation

struct Restaurant {
    var name: String?
    var category: String?
    var phone: String?
    var imageString: String?
    var rating: Double?
    var reviews: Int?
    
    init(data: [String: Any]) {
        name = data["name"] as? String
        imageString = data["image_url"] as? String
        if let categories = data["categories"] as? [[String: String]] {
            category = categories[0]["title"]
        }
        reviews = data["review_count"] as? Int
        rating = data["rating"] as? Double
        phone = data["phone"] as? String
    }
}
