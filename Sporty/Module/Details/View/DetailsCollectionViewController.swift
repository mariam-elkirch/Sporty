//
//  DetailsCollectionViewController.swift
//  Sporty
//
//  Created by  Hager Magdy on 5/15/22.
//  Copyright © 2022 iti. All rights reserved.
//

import UIKit
import Kingfisher
import Alamofire
protocol DetailLeagueProtocol : AnyObject{
    func stopAnimatingev()
    func renderDetailCollectionViewev()
}
class DetailsCollectionViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate, DetailLeagueProtocol {
 var presenter : DetailsLeaguePresenter!
    var resultView: [Event] = []
    var upcommingEventSelect: [Event] = []
         // Modle for View
       var strSportName : String? = ""
    var leagueNameForView : String? = ""
    var strCountery : String? = ""
   var teamSelect:Array<Team>=[]
  
       var presenterTeam : TeamPresenter?
 var resultViewTeam :[String]? = []
    
    @IBOutlet weak var upcommingcollection: UICollectionView!
    @IBOutlet weak var latesteventcollection: UICollectionView!
    
    @IBOutlet weak var mycollection: UICollectionView!
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.mycollection.collectionViewLayout = layout
             presenter = DetailsLeaguePresenter(NWService: NetworkServic())
        presenter.attachView(view: self)
          presenterTeam = TeamPresenter(NWService: NetworkServic())
        presenterTeam?.attachView(view: self)
        print("presenterrrrrrrviewmmmmmmmmmmmmmmmmmmm")
        mycollection.dataSource = self
                 mycollection.delegate = self
                     latesteventcollection.delegate=self
                     latesteventcollection.dataSource=self
                     upcommingcollection.delegate=self
                     upcommingcollection.dataSource = self
          print("after sourceviewmmmmmmmmmmmmmmmmmmm")
        presenter.getItems(myidLeag: "4328")
          print("pget itemsrrrrrrrviewmmmmmmmmmmmmmmmmmmm")
        
        presenterTeam?.getItemsTeams(strLeague: leagueNameForView ?? "B" )
    }
    func stopAnimatingev() {
           
       }
       
       func renderDetailCollectionViewev() {
        print("rendermmmmmmmmmmmmm")
          /* resultView = presenter.resultev?.map({ (myitem) -> String in
            print(myitem.idEvent, "hiiiiiiiiiiiiiiiiiiiiiiiiii")
            return myitem.idEvent ?? ""
           })*/
        self.resultView = presenter.resultev ?? []
        if(resultView.count != 0){
        print(resultView[1].idEvent , "mmmmmmmmmmmmmmmmmmmmmmmmmmariam")
        }
        self.latesteventcollection.reloadData()
          resultViewTeam = presenterTeam?.resultT.map({(item) -> [String] in
                   print("hag")
                  // print(item.strSport)
            print( item[1].strTeamBadge , "hagerrrrrrrrrrr")

            self.teamSelect.append(contentsOf: item)
            presenterTeam?.getItemsTeams(strLeague: leagueNameForView ?? "B")
            self.mycollection.reloadData()

                 //  print(sportSelect[1].strSport ?? "")
            return resultViewTeam ?? []
        })

               self.mycollection.reloadData()
        self.latesteventcollection.reloadData()
      //  self.latestResultResponse = presenter.result ?? []
       // myCollectionView.reloadData()
      //  latestCollectionView.reloadData()
       }
       
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           if (collectionView == mycollection){
            return teamSelect.count
           }
           else if (collectionView == latesteventcollection){
            return resultView.count
           }
           else{
               return 2}
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           if (collectionView == self.mycollection){
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailcell", for: indexPath) as! MyCustomTeamCollectionViewCell
                let url=URL(string: teamSelect[indexPath.row].strTeamBadge ?? "https://pngimage.net/wp-content/uploads/2018/05/courses-png-6.png")
                           
            let res=ImageResource(downloadURL: url!)
                   cell.myImage.kf.setImage(with: res, placeholder: UIImage(named: "flower1.jpg"))
                // cell.myimg.kf.setImage(with: res)
            //cell.s(with: images[indexPath.row])
        
            
              // cell.myImage =
               return cell
           }
           else if (collectionView == self.upcommingcollection){
                let cellup = upcommingcollection.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! UpCollectionViewCell
               cellup.uplabel.text = "mmmmmmmmmmmmmmmmmmm"
               return cellup
           }
           else {//collectionView == self.latesteventcollection{
               let celllat = latesteventcollection.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath) as! LatestEventsCollectionViewCell
            celllat.latestlabel.text =  resultView[indexPath.row].idEvent
               return celllat
           }
          
       }
       func compareDate(eventDate:String)->Int{
         var comparedValue=0
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let currentDate = dateFormatter.string(from: date)
        if eventDate.compare(currentDate) == .orderedSame {
                  comparedValue = 1
               }
               else if eventDate.compare(currentDate) == .orderedAscending{
                   comparedValue = 2
               }
               else if eventDate.compare(currentDate) == .orderedDescending{
                   comparedValue = 3
               }
        else{
            comparedValue = 0
        }
        return comparedValue
    }
    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

                if let cell = sender as? UICollectionViewCell,
                    
                   let indexPath = mycollection.indexPath(for: cell) {
                    let vc = segue.destination as! TeamDetailsViewController
                    
                    //Now simply set the title property of
vc.strTeamImage = teamSelect[indexPath.row].strTeamBadge
                    vc.capacity = teamSelect[indexPath.row].intStadiumCapacity
                    vc.desc = teamSelect[indexPath.row].strDescriptionEN
                    vc.year = teamSelect[indexPath.row].intFormedYear
                    vc.staduimLoc = teamSelect[indexPath.row].strStadiumLocation
                    vc.staduimName = teamSelect[indexPath.row].strStadium
                
                }

}
}
