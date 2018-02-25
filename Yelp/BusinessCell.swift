//
//  BusinessCell.swift
//  Yelp
//
//  Created by somi on 2/24/18.
//  Copyright © 2018 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {

  @IBOutlet var thumbImageView: UIImageView!
  @IBOutlet var ratingsImageView: UIImageView!
  @IBOutlet var nameLabel: UILabel!
  @IBOutlet var addressLabel: UILabel!
  @IBOutlet var categoriesLabel: UILabel!
  @IBOutlet var reviewsCountLabel: UILabel!
  @IBOutlet var distanceLabel: UILabel!
  @IBOutlet var priceLabel: UILabel!
  
  var business: Business! {
    didSet {
      nameLabel.text = business.name
      thumbImageView.setImageWith(business.imageURL!)
      categoriesLabel.text = business.categories
      addressLabel.text = business.address
      reviewsCountLabel.text = "\(business.reviewCount!) Reviews"
      ratingsImageView.setImageWith(business.ratingImageURL!)
      distanceLabel.text = business.distance
      
    }
  }
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
      thumbImageView.layer.cornerRadius = 3
      thumbImageView.clipsToBounds = true
    }

  override func layoutSubviews() {
    super.layoutSubviews()
    nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
  }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
