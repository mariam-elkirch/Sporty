//
//  LatestEventsCollectionViewCell.swift
//  Sporty
//
//  Created by user188930 on 5/16/22.
//  Copyright © 2022 iti. All rights reserved.
//

import UIKit

class LatestEventsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var latestlabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var imgname: UIImageView!
    @IBOutlet weak var teamname: UILabel!
    @IBOutlet weak var secscore: UILabel!
    @IBOutlet weak var scorefirst: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
