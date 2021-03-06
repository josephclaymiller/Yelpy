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
    var starImageName: String!
    
    init(data: Restaurant) {
        name = data.name ?? ""
        category = data.category ?? ""
        imageString = data.imageString ?? ""
        rating = (data.rating != nil) ? String(data.rating!) : ""
        reviews = (data.reviews != nil) ? String(data.reviews!) : ""
        starImageName = Stars.imageName[data.rating ?? 0]
        
        if let phoneNumber = data.phone {
            phone = ""
            do {
                try phone = phoneNumber.formatPhoneNumber()
            } catch PhoneNumberError.noNumber {
                print("Missing phone number")
            } catch PhoneNumberError.numberTooLong(let extraDigits) {
                print("Phone number is \(extraDigits) characters too long")
            } catch PhoneNumberError.numberTooShorts(let digitsNeeded) {
                print("Phone number is \(digitsNeeded) characters too short")
            } catch {
                print("Unexpected error: \(error).")
            }
            
        }
        
    }

}

struct Stars {
    
    static let imageName = [
        0: Stars.zero,
        1: Stars.one,
        1.5: Stars.oneHalf,
        2: Stars.two,
        2.5: Stars.twoHalf,
        3: Stars.three,
        3.5: Stars.threeHalf,
        4: Stars.four,
        4.5: Stars.fourHalf,
        5: Stars.five
    ]
    
    static let zero = "regular_0"
    static let one = "regular_1"
    static let oneHalf = "regular_1_half"
    static let two = "regular_2"
    static let twoHalf = "regular_2_half"
    static let three = "regular_3"
    static let threeHalf = "regular_3_half"
    static let four = "regular_4"
    static let fourHalf = "regular_4_half"
    static let five = "regular_5"
    
}

enum PhoneNumberError: Error {
    case numberTooLong(extraDigits: Int)
    case numberTooShorts(digitsNeeded: Int)
    case noNumber
}

extension String {
    // Input: phone number formatted as "+1xxxxxxxxxx"
    // Output: phone number formatted as "(xxx) xxx-xxxx"
    func formatPhoneNumber() throws -> String {
        let phoneNumberLength = 12
        guard self.count == phoneNumberLength else {
            if (self.count == 0) {
                throw PhoneNumberError.noNumber
            } else if (self.count > phoneNumberLength) {
                throw PhoneNumberError.numberTooLong(extraDigits: (self.count - phoneNumberLength))
            } else {
                throw PhoneNumberError.numberTooShorts(digitsNeeded: (phoneNumberLength - self.count))
            }
        }
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
