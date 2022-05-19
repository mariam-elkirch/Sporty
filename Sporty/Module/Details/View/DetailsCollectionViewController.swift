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
    var leagueEventName: String? = ""
   var teamSelect:Array<Team>=[]
    var upcommingEventResult: [Event] = []
       var presenterTeam : TeamPresenter?
 var resultViewTeam :[String]? = []
    
    @IBOutlet weak var upcommingcollection: UICollectionView!
    @IBOutlet weak var latesteventcollection: UICollectionView!
    
    @IBOutlet weak var mycollection: UICollectionView!
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
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
        presenter.getItems(idfromViewLeg: "4416")
          print(leagueEventName,"pget itemsrrrrrrrviewmmmmmmmmmmmmmmmmmmm")
        
        presenterTeam?.getItemsTeams(strLeague: leagueNameForView ?? "B" )
        
        
       latesteventcollection.collectionViewLayout = UICollectionViewFlowLayout()

              //
              if let layout = latesteventcollection?.collectionViewLayout as? UICollectionViewFlowLayout{
                       layout.minimumLineSpacing = 0
                   layout.minimumInteritemSpacing = 0
                       layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                     //  let size = CGSize(width:(mycollectionsport!.bounds.width-165)/2, height: 220)
                  // let size = CGSize(width : latesteventcollection.frame.width * 0.44999 , height: latesteventcollection.frame.height * 0.249)
                layout.itemSize =   CGSize(width: latesteventcollection.frame.width, height: latesteventcollection.frame.height)
                layout.scrollDirection = .vertical
       
                 /// teamsCollectionView.collectionViewLayout = teamCell_layout
                latesteventcollection.collectionViewLayout = layout
        }
                
                
                
                if let layoutupgrade = upcommingcollection?.collectionViewLayout as? UICollectionViewFlowLayout{
                                      layoutupgrade.minimumLineSpacing = 0
                                  layoutupgrade.minimumInteritemSpacing = 0
                                      layoutupgrade.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                               layoutupgrade.itemSize =   CGSize(width: upcommingcollection.frame.width, height: upcommingcollection.frame.height * 2)
                              layoutupgrade.scrollDirection = .horizontal
                      
                                /// teamsCollectionView.collectionViewLayout = teamCell_layout
                               upcommingcollection.collectionViewLayout = layoutupgrade
                   
                }
                
                
        
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
        if( resultView.count > 0){
        print(resultView[1].idEvent , "mmmmmmmmmmmmmmmmmmmariam")
            var count = resultView.count ?? 0
                                 for i in stride(from: 0, to: count-1 , by: 1){
                                       print(resultView[i].dateEvent ,"mmmmmmmmmm")
                                   var cc = compareDate(eventDate:resultView[i].dateEvent ?? "")
                                  print(cc , "mmmmmmmmmmmmmmmmmm")
                                 if(compareDate(eventDate:resultView[i].dateEvent ?? "") == 3 ){
                                     print(resultView[i].dateEvent , "mmmmmmmmmmmmmmnside id")
                                     upcommingEventResult.append((resultView[i]))
                             //self.tableView.reloadData()
                                 }
                                 }
                  if(upcommingEventResult.count != 0){
                      
                      print(upcommingEventResult[1].idEvent , "mmmmmmmmmmmmghaa")
                      
                  }
        }
       
      
        
        
        
        
          resultViewTeam = presenterTeam?.resultT.map({(item) -> [String] in
                   print("hag")
                  // print(item.strSport)
            print( item[1].strTeamBadge , "hagerrrrrrrrrrr")

            self.teamSelect.append(contentsOf: item)
            presenterTeam?.getItemsTeams(strLeague: leagueNameForView ?? "B")
                 //  print(sportSelect[1].strSport ?? "")
            return resultViewTeam ?? []
        })
        self.upcommingcollection.reloadData()
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
               cellup.uplabel.text = "mmmmmmmmmmmm"
            cellup.upcommingImg.image = UIImage(named: "flower1.jpg")
            cellup.dateLabelUpcome.text = "vvvv"
            cellup.timeUpcomeLabel.text = "mmmm"
               return cellup
           }
           else {//collectionView == self.latesteventcollection{
               let celllat = latesteventcollection.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath) as! LatestEventsCollectionViewCell
            celllat.backgroundColor = .cyan
            celllat.latestlabel.text =  resultView[indexPath.row].strHomeTeam
            
            
            let url=URL(string: resultView[indexPath.row].strThumb ?? "https://pngimage.net/wp-content/uploads/2018/05/courses-png-6.png")
                                      
                       let res=ImageResource(downloadURL: url!)
           celllat.imgname.kf.setImage(with: res, placeholder: UIImage(named: "flower1.jpg"))
            //celllat.imgname.image = UIImage(named: "flower1.jpg")
            celllat.dateLabel.text = resultView[indexPath.row].dateEvent
            celllat.teamname.text = resultView[indexPath.row].strAwayTeam
            celllat.scorefirst.text = resultView[indexPath.row].intHomeScore
            celllat.secscore.text = resultView[indexPath.row].intAwayScore
            celllat.timeLabel.text = resultView[indexPath.row].strTime
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

}

























