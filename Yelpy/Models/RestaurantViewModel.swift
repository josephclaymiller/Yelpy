//
//  RestaurantViewModel.swift
//  Yelpy
//
//  Created by Joseph Miller on 11/5/20.
//

import Foundation

struct RestaurantViewModel {
    var name: String!
    var category: String!
    var phone: String!
    var imageString: String!
    var rating: String!
    var reviews: String!
    
    init(data: Restaurant) {
        name = data.name ?? ""
        category = data.category ?? ""
        phone = data.phone?.formatPhoneNumber()
        imageString = data.imageString ?? ""
        rating = (data.rating != nil) ? String(data.rating!) : ""
        reviews = (data.reviews != nil) ? String(data.reviews!) : ""
    }

}

extension String {
    // Input: phone number formatted as "+1xxxxxxxxxx"
    // Output: phone number formatted as "(xxx) xxx-xxxx"
    func formatPhoneNumber() -> String {
        // Area Code
        var start = self.index(self.startIndex, offsetBy: 2)
        var end = self.index(self.endIndex, offsetBy: -7)
        var range = start..<end
        let areaCode = self[range]
        // Exchange Code
        start = self.index(self.startIndex, offsetBy: 5)
        end = self.index(self.endIndex, offsetBy: -4)
        range = start..<end
        let exchangeCode = self[range]
        // Subscriber Number
        start = self.index(self.startIndex, offsetBy: 8)
        end = self.index(self.endIndex, offsetBy: 0)
        range = start..<end
        let subscriberNumber = self[range]
        // Formatted Phone Number
        let formattedPhoneNumber = "(\(areaCode)) \(exchangeCode)-\(subscriberNumber)"
        return formattedPhoneNumber
    }
}
