//
//  TeamDetailsViewController.swift
//  Sporty
//
//  Created by  Hager Magdy on 5/17/22.
//  Copyright © 2022 iti. All rights reserved.
//

import UIKit
import Kingfisher
class TeamDetailsViewController: UIViewController {
    
    @IBOutlet weak var myTeamImg: UIImageView!
    
    @IBOutlet weak var formedYear: UILabel!
    
    
    @IBOutlet weak var staduim: UILabel!
    
    @IBOutlet weak var stadiumCpacity: UILabel!
    
    @IBOutlet weak var stadiumLocation: UILabel!
    
    @IBOutlet weak var detailsLabel: UILabel!
    var strTeamImage : String?
        var year : String?
         var capacity: String?
         var staduimName : String?
         var staduimLoc: String?
         var desc: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url=URL(string: strTeamImage ?? "https://pngimage.net/wp-content/uploads/2018/05/courses-png-6.png")
                                  
        let res = ImageResource(downloadURL: url!)
        
       myTeamImg.kf.setImage(with: res, placeholder: UIImage(named: "flower1.jpg"))
        print( staduimName ,"stadteamdetails")
        formedYear.text = year
        staduim.text = staduimName
        stadiumCpacity.text = capacity
        stadiumLocation.text = staduimLoc
        detailsLabel.text = desc
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
