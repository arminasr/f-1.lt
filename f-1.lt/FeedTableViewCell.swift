//
//  FeedTableViewCell.swift
//  f-1.lt
//
//  Created by Arminas on 02/10/2016.
//  Copyright © 2016 Arminas. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    @IBOutlet weak var feedTitle: UILabel!
    @IBOutlet weak var feedContent: UILabel!
    @IBOutlet weak var feedImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
