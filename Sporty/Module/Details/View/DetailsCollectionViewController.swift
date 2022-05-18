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
    var strSportName : String? = ""
    var strCountery : String? = ""
   var teamSelect:Array<Team>=[]
    var presenter : DetailsLeaguePresenter?
    var presenterTeam : TeamPresenter?

    
    var resultView: [Event] = []
    var resultViewTeam :[String] = []
    
         // Modle for View
      
    
    
    @IBOutlet weak var upcommingcollection: UICollectionView!
    @IBOutlet weak var latesteventcollection: UICollectionView!
    @IBOutlet weak var mycollection: UICollectionView!
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
             presenter = DetailsLeaguePresenter(NWService: NetworkServic())
        presenterTeam = TeamPresenter(NWService: NetworkServic())
        presenter?.attachView(view: self)
        presenterTeam?.attachView(view: self)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.mycollection.collectionViewLayout = layout
        print("presenterrrrrrrviewmmmmmmmmmmmmmmmmmmm")
        mycollection.dataSource = self
                 mycollection.delegate = self
                     latesteventcollection.delegate=self
                     latesteventcollection.dataSource=self
                     upcommingcollection.delegate=self
                     upcommingcollection.dataSource = self
          print("after sourceviewmmmmmmmmmmmmmmmmmmm")
        presenter?.getItems(myidLeag: "4328")
          print("pget itemsrrrrrrrviewmmmmmmmmmmmmmmmmmmm")
        
        
        /////////TEAM PRESENTER
        print(strSportName , "spoertnameeeee" )
        print(strCountery , "counteryyyy")
        presenterTeam?.getItemsTeams(sportName: strSportName ?? "B" , countery:strCountery ?? "")
        print(presenterTeam?.getItemsTeams(sportName: strSportName ?? "Soccer" , countery:strCountery ?? ""
            ), "noteam")
    }
    func stopAnimatingev() {
           
       }
       
       func renderDetailCollectionViewev() {
        print("rendermmmmmmmmmmmmm")

          /* resultView = presenter.resultev?.map({ (myitem) -> String in
            print(myitem.idEvent, "hiiiiiiiiiiiiiiiiiiiiiiiiii")
            return myitem.idEvent ?? ""
           })*/
        
        self.resultView = presenter?.resultev ?? []
//        self.resultViewTeam = presenterTeam?.result ?? []
//        var countTeam : Int?
//        countTeam = presenterTeam?.result?.count
//        print(resultViewTeam[1].strTeamBadge , "hagerrrrrrrrrrr")
//        teamSelect.append(resultViewTeam[countTeam ?? 1 ])
      //  print(resultView[1].idEvent , "mmmmmmmmmmmmmmmmmmmmmmm")
        //mycollection.reloadData()
        ///////
        
        resultViewTeam = presenterTeam?.resultT.map({(item) -> [String]? in
                   print("hag")
                  // print(item.strSport)
            print( item[1].strTeamBadge , "hagerrrrrrrrrrr")

            self.teamSelect.append(contentsOf: item)
            presenterTeam?.getItemsTeams(sportName: strSportName ?? "", countery: strCountery ?? "")
                 //  print(sportSelect[1].strSport ?? "")
                   return resultViewTeam
        }) as! [String]

               self.mycollection.reloadData()
        
//////
     print("hag")
//              //  self.teamSelect.append(item)
//        presenterTeam?.getItemsTeams(sportName: "d")
//
//             //  print(sportSelect[1].strSport ?? "")
//              // return item.strTeamBadge ?? ""
        
        
        
        
        ///
      //  self.latestResultResponse = presenter.result ?? []
       // myCollectionView.reloadData()
      //  latestCollectionView.reloadData()
       }
       
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           if (collectionView == mycollection){
            return teamSelect.count
           }
           else if (collectionView == latesteventcollection){
            return 2
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
            celllat.latestlabel.text = "hi" //eventSelect[indexPath.row].idHomeTeam
               return celllat
           }
          
       }
//      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//                if let cell = sender as? UICollectionViewCell,
//
//                   let indexPath = mycollection.indexPath(for: cell) {
//    //myCollectionViewTeams
//                    let vc = segue.destination as! DetailsCollectionViewController //Cast with your DestinationController
//                    //Now simply set the title property of vc
//                   // vc.id = legueSelect[indexPath.row].idLeague
//                    //vc.str =  legueSelect[indexPath.row].strLeague
//                              //     vc.sport = legueSelect[indexPath.row].strLeague
//
//                }
//           }
       
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
