//
//  FavTableViewCell.swift
//  Sporty
//
//  Created by user188930 on 5/21/22.
//  Copyright © 2022 iti. All rights reserved.
//

import UIKit

class FavTableViewCell: UITableViewCell {

    @IBOutlet weak var imgFav: UIImageView!
    @IBOutlet weak var labelFav: UILabel!
    @IBOutlet weak var btnFavYou: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
