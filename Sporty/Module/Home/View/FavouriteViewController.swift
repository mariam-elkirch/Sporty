//
//  FavouriteViewController.swift
//  Sporty
//
//  Created by user188930 on 5/20/22.
//  Copyright © 2022 iti. All rights reserved.
//

import UIKit

class FavouriteViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource  {
    

    @IBOutlet weak var favTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.favTable.delegate = self
        self.favTable.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView (_ tableView : UITableView ,heightForRowAt heightForRowAtIndexPath: IndexPath) -> CGFloat{
          return 100
          }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cellFav = tableView.dequeueReusableCell(withIdentifier: "cellFav", for: indexPath) as! FavTableViewCell
        cellFav.labelFav.adjustsFontSizeToFitWidth = true
        //cell.myLabel.minimumScaleFactor = 0.4
        cellFav.labelFav.text = "mariam"
        
        return cellFav

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
