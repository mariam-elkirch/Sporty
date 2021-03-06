//
//  FavouriteViewController.swift
//  Sporty
//
//  Created by user188930 on 5/20/22.
//  Copyright © 2022 iti. All rights reserved.
//

import UIKit
import Kingfisher
import  Network
protocol FavouriteLeaguesControllerProtocol : AnyObject{
    func displayFavouriteLeagues()
  }
class FavouriteViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource, FavouriteLeaguesControllerProtocol  {
  let monitor = NWPathMonitor()
  
    let queue = DispatchQueue(label: "InternetConnectionMonitor")
    
   //  var dataModel : LocalDataModel?
     var presenter = FavouritePresenter()
     var favouriteResult: [FavourieLeague] = []
      var urlSelected : String?
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
        favTable.reloadData()
        //favouriteResult = presenter.fetchLeaguesFromCoreData()
        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(_ animated: Bool) {
        presenter.fetchLeaguesFromCoreData()
       favouriteResult = presenter.resultLeagueCoreData
        favTable.reloadData()
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
        cellFav.labelFav.adjustsFontSizeToFitWidth = true
        cellFav.labelFav.minimumScaleFactor = 0.49
         cellFav.labelFav.preferredMaxLayoutWidth = 150
        cellFav.labelFav.text = favouriteResult[indexPath.row].strLeague
       
      let url=URL(string:self.favouriteResult[indexPath.row].strBadge ??
                "https://www.thesportsdb.com//images//media//league//badge//6my1u31578828133.png" )
                let res=ImageResource(downloadURL:url!)

        cellFav.imgFav?.kf.setImage(with: res, placeholder: UIImage(named: "nemo.jpg"))
                
              cellFav.imgFav?.layer.cornerRadius = (cellFav.imageView?.frame.size.width)!/2
              cellFav.imgFav?.layer.masksToBounds = true
               cellFav.imgFav?.layer.borderWidth = 2
                if (favouriteResult[indexPath.row].strYoutube ==  ""){
                    cellFav.btnFavYou.isHidden = true
                }
                else {
                    cellFav.btnFavYou.tag = indexPath.row
                 cellFav.btnFavYou.addTarget(self, action: #selector(openYoutube(sender: )), for: .touchUpInside)
                urlSelected = favouriteResult[indexPath.row].strYoutube
                }
        return cellFav

    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
          if editingStyle == .delete {
                print("Deletedtableview successfullyyyyyy")
            presenter.deleteLeagueFromCoreData(myidLeague: favouriteResult[indexPath.row].idLeague)
               favouriteResult.remove(at: indexPath.row)
                tableView.reloadData()

              }
              }
  
     @objc
        func openYoutube(sender : UIButton ){
            if let url = URL(string : "https://\(urlSelected ?? "https://www.google.com")"){
                print(urlSelected!)
                UIApplication.shared.open(url , options : [:]){
                    (done) in
    //                print("Opend sucsesfully")
                    if done {
                               print("opened")
                           } else {
                               print("failed")
                               // showInvalidUrlAlert()
                           }
                }
            }
            print("button")
        }
        
    func displayFavouriteLeagues() {
    // presenter.fetchLeaguesFromCoreData()
         // favouriteResult = presenter.resultLeagueCoreData
                 print(favouriteResult.count , "fetchhh")
      }
    
    // MARK: - Navigation
 override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
  var  isInternetConnect : Bool?
 
    if (Connectivity.isConnectedToInternet()) {
        isInternetConnect = true
        print("Yes internet is available.")
        // do some tasks..
    }else{
        isInternetConnect = false
         print("No internet ")
           let actionsheet = UIAlertController(title: "Can not load leage details data", message: " check your internet connection ", preferredStyle: .actionSheet)
            
            
            actionsheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            present(actionsheet, animated: true, completion: nil)
        }
              
    
    return isInternetConnect!
}
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let cell = sender as? UITableViewCell,
      
                          let indexPath = favTable.indexPath(for: cell) {
           //myCollectionViewTeams
                           let vc = segue.destination as! DetailsCollectionViewController //Cast with your
                           vc.l = favouriteResult[indexPath.row]
                           vc.leagueNameForView = favouriteResult[indexPath.row].strLeague
            vc.leagueEventId = favouriteResult[indexPath.row].idLeague
        // Pass the selected object to the new view controller.
            }
   
           }

}
