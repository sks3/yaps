//
//  BusinessDetailViewController.swift
//  Yelp
//
//  Created by somi on 2/26/18.
//  Copyright © 2018 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessDetailViewController: UIViewController {

    var business: Business!
  
  @IBOutlet var nameLabel: UILabel!
  @IBOutlet var reviewImage: UIImageView!
  @IBOutlet var reviewCount: UILabel!
  @IBOutlet var businessImage: UIImageView!
  @IBOutlet var addressLabel: UILabel!  
  @IBOutlet var categoriesLabel: UILabel!
  @IBOutlet var distanceLabel: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      nameLabel.text = business.name
      businessImage.setImageWith(business.imageURL!)
      categoriesLabel.text = business.categories
      addressLabel.text = business.address
      reviewCount.text = "\(business.reviewCount!) Reviews"
      reviewImage.setImageWith(business.ratingImageURL!)
      distanceLabel.text = business.distance
      nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
      businessImage.layer.cornerRadius = 5
      businessImage.clipsToBounds = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  

}
