//
//  FavouriteViewController.swift
//  Sporty
//
//  Created by user188930 on 5/20/22.
//  Copyright © 2022 iti. All rights reserved.
//

import UIKit
import Kingfisher
protocol FavouriteLeaguesControllerProtocol : AnyObject{
    func displayFavouriteLeagues()
  }
class FavouriteViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource, FavouriteLeaguesControllerProtocol  {
  
    
   //  var dataModel : LocalDataModel?
     var presenter = FavouritePresenter()
     var favouriteResult: [FavourieLeague] = []
    @IBOutlet weak var favTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.favTable.delegate = self
        self.favTable.dataSource = self
        presenter.attachView(view: self)
       // dataModel = LocalDataModel()
      //  favouriteResult =  dataModel?.fetchLeagues() as! [FavourieLeague]
        presenter.fetchLeaguesFromCoreData()
        favouriteResult = presenter.resultLeagueCoreData
        print(favouriteResult[0].idLeague,"fetchhh")
        //favouriteResult = presenter.fetchLeaguesFromCoreData()
        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(_ animated: Bool) {
        presenter.fetchLeaguesFromCoreData()
       favouriteResult = presenter.resultLeagueCoreData
        print(favouriteResult.count , "fetchhh")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouriteResult.count
    }
    func tableView (_ tableView : UITableView ,heightForRowAt heightForRowAtIndexPath: IndexPath) -> CGFloat{
          return 100
          }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cellFav = tableView.dequeueReusableCell(withIdentifier: "cellFav", for: indexPath) as! FavTableViewCell
        //cellFav.labelFav.adjustsFontSizeToFitWidth = true
        //cellFav.labelFav.minimumScaleFactor = 2.5
        cellFav.labelFav.text = "mmmmmmmmmm"//favouriteResult[indexPath.row].strLeague
        
        cellFav.imgFav.image = UIImage(named: "imgball")
        return cellFav

    }
    func displayFavouriteLeagues() {
    // presenter.fetchLeaguesFromCoreData()
         // favouriteResult = presenter.resultLeagueCoreData
                 print(favouriteResult.count , "fetchhh")
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
