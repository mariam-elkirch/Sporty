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
class DetailsCollectionViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,  DetailLeagueProtocol {
    
    @IBOutlet weak var LeagueFavBtn: UIButton!
    var presenter : DetailsLeaguePresenter!
    var resultView: [Event] = []
    var upcommingEventSelect: [Event] = []
    var core : LocalDataModel?
         // var leg : League?
         // Modle for View
    var l : FavourieLeague?
       var strSportName : String? = ""
    var leagueNameForView : String? = ""
    var strCountery : String? = ""
    var leagueEventId: String? = ""
   var teamSelect:Array<Team>=[]
   // var myfav : FavourieLeague?
    var upcommingEventResult: [Event] = []
       var presenterTeam : TeamPresenter?
 var resultViewTeam :[String]? = []
    var isFav : Bool = false
    @IBOutlet weak var upcommingcollection: UICollectionView!
    @IBOutlet weak var latesteventcollection: UICollectionView!
    
    @IBOutlet weak var mycollection: UICollectionView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        print(l?.idLeague,"favourite")
               LeagueFavBtn.addTarget(self, action: #selector(addToFavorite(sender:)), for: .touchUpInside)
       
    
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
          print("after sourceviewmmmmmmmm1mmmmmmmmmmm")
        presenter.getItems(idfromViewLeg: leagueEventId!)
          print(leagueEventId,"pget itemsrrrrrrrviewmmmmmmmmmmmmmmmmmmm")
     
        presenterTeam?.getItemsTeams(strLeague: leagueNameForView ?? "B" )
        
        
 
        
    }
    
    
    
    @IBAction func backBtn(_ sender: UIButton) {
         dismiss(animated: true, completion: nil)
    }
    
    func stopAnimatingev() {
           
       }
       
       func renderDetailCollectionViewev() {
        print("rendermmmmmmmmmmmmm")
        self.resultView = presenter.resultev ?? []
      
        if( resultView.count > 0){
      
            var count = resultView.count ?? 0
                       for i in stride(from: 0, to: count-1 , by: 1){
                        print(resultView[i].dateEvent , "mmmmmmmmm")
                       if(compareDate(eventDate:resultView[i].dateEvent ?? "") == 3 ){
                           print(resultView[i].dateEvent , "mmmmmmmmmmminside id")
                           upcommingEventResult.append((resultView[i]))
                         self.upcommingcollection.reloadData()
                       }
                       }
        if(upcommingEventResult.count != 0){
            
            print(upcommingEventResult[1].idEvent , "mmmmmariam")
            
        }
                                 
                
        }
    
      
        
          resultViewTeam = presenterTeam?.resultT.map({(item) -> [String] in
                   print("hag")


            self.teamSelect.append(contentsOf: item)
            self.mycollection.reloadData()

            return resultViewTeam ?? []
        })
        self.upcommingcollection.reloadData()
               self.mycollection.reloadData()
        self.latesteventcollection.reloadData()
       }
       
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           if (collectionView == mycollection){
            return teamSelect.count
           }
           else if (collectionView == latesteventcollection){
            return resultView.count
           }
           else{
            return upcommingEventResult.count}
       }
    @objc func addToFavorite(sender :UIButton){
        print("btnFav")
        if(l != nil){
               sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            if(isFav == false){
     presenter.insertData(leg: l!)
                isFav = true
            }
            
    }
    }
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
       
        
           if (collectionView == self.mycollection){
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailcell", for: indexPath) as! MyCustomTeamCollectionViewCell
                let url=URL(string: teamSelect[indexPath.row].strTeamBadge ?? "https://pngimage.net/wp-content/uploads/2018/05/courses-png-6.png")
                           
            let res=ImageResource(downloadURL: url!)
                   cell.myImage.kf.setImage(with: res, placeholder: UIImage(named: "flower1.jpg"))
     
               return cell
           }
           else if (collectionView == self.upcommingcollection){
                let cellup = upcommingcollection.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! UpCollectionViewCell
           
             cellup.uplabel.text = upcommingEventResult[indexPath.row].strEvent
            
            let url=URL(string: upcommingEventResult[indexPath.row].strThumb ?? "https://pngimage.net/wp-content/uploads/2018/05/courses-png-6.png")
           if(url != nil){
            let res=ImageResource(downloadURL: url!)
            cellup.upcommingImg.kf.setImage(with: res, placeholder: UIImage(named: "flower1.jpg"))
            }
            cellup.dateLabelUpcome.text = upcommingEventResult[indexPath.row].dateEvent
                cellup.timeUpcomeLabel.text = upcommingEventResult[indexPath.row].strTime
               return cellup
           }
           else {
               let celllat = latesteventcollection.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath) as! LatestEventsCollectionViewCell
          
            celllat.latestlabel.text =  resultView[indexPath.row].strHomeTeam
            
            
            let url=URL(string: resultView[indexPath.row].strThumb ?? "https://pngimage.net/wp-content/uploads/2018/05/courses-png-6.png")
                     if(url != nil){
                       let res=ImageResource(downloadURL: url!)
           celllat.imgname.kf.setImage(with: res, placeholder: UIImage(named: "flower1.jpg"))
            }
            
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

                if let cell = sender as? UICollectionViewCell,
                    
                   let indexPath = mycollection.indexPath(for: cell) {
                    let vc = segue.destination as! TeamDetailsViewController
                    
vc.strTeamImage = teamSelect[indexPath.row].strTeamBadge
                    vc.capacity = teamSelect[indexPath.row].intStadiumCapacity
                    vc.desc = teamSelect[indexPath.row].strDescriptionEN
                    vc.year = teamSelect[indexPath.row].intFormedYear
                    vc.staduimLoc = teamSelect[indexPath.row].strStadiumLocation
                    vc.staduimName = teamSelect[indexPath.row].strStadium
                
                }

}

}

extension DetailsCollectionViewController :  UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           let screenSize: CGRect = UIScreen.main.bounds
         let screenWidth = screenSize.width
         let screenHeight = screenSize.height
           var returnedSize = CGSize()
           
           if (collectionView == latesteventcollection){
            returnedSize =  CGSize(width:collectionView.frame.size.width  , height: collectionView.frame.size.height)
           }
           if (collectionView == mycollection){
               returnedSize =  CGSize(width: collectionView.frame.width / 3 , height: collectionView.frame.width / 3)
           }
           if (collectionView == upcommingcollection){
               
               returnedSize = CGSize(width: collectionView.frame.size.width  , height: collectionView.frame.size.height )
           }
           
           return returnedSize
           
       }
   
        
    }
    
  
   
        
    
    
  
