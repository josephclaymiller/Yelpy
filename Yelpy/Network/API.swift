//
//  API.swift
//  Yelpy
//
//  Created by Joseph Miller on 11/5/20.
//

import Foundation

struct API {

    // Gets restaurant data from Yelp as json
    // Converts json response to a dictionary
    // Then creates an array of dictionaries for restaurants
    // Then sends it in completion to escape the closure
    static func getRestaurants(completion: @escaping ([[String: Any]]?) -> Void) {
        let apiKey = INSERT_YELP_API_KEY_HERE
        // Coordinates for San Francisco (Noe Valley)
        let lat = 37.7502
        let long = -122.4337
        // network request
        let timeout: Double = 10
        let url = URL(string: "https://api.yelp.com/v3/transactions/delivery/search?latitude=\(lat)&longitude=\(long)")!
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: timeout)
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let restaurants = dataDictionary["businesses"] as! [[String: Any]]
                return completion(restaurants)
            }
        }
        task.resume()
    }
}
