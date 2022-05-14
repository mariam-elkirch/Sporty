//
//  MyCustomCellTableViewCell.swift
//  Sporty
//
//  Created by  Hager Magdy on 5/13/22.
//  Copyright © 2022 iti. All rights reserved.
//

import UIKit
class MyCustomCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myImage: UIImageView!
    
    @IBOutlet weak var myLabel: UILabel!
  
    @IBOutlet weak var myBtn: UIButton!
    
    
//    override func layoutSubviews(){
//            myImage.layer.cornerRadius = myImage.bounds.height / 2
//                myImage.clipsToBounds = true
//    }
    override func awakeFromNib() {
        super.awakeFromNib()
//        myImage.layer.cornerRadius = myImage.bounds.height / 2
//        myImage.clipsToBounds = true
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
