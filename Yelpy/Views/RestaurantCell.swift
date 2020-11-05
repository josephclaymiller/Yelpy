//
//  RestaurantCell.swift
//  Yelpy
//
//  Created by Joseph Miller on 11/5/20.
//

import UIKit

class RestaurantCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBOutlet weak var reviewsLabel: UILabel!
    @IBOutlet weak var starsImageView: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
