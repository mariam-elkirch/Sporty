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
   
    
 //  var eventSelect:Array<Event>=[]
   var presenter : DetailsLeaguePresenter!
    var resultView: [String]!
         // Modle for View
      
    
    
    @IBOutlet weak var upcommingcollection: UICollectionView!
    @IBOutlet weak var latesteventcollection: UICollectionView!
    
    @IBOutlet weak var mycollection: UICollectionView!
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        print("first view did load mmmmmmmmmmm")
             presenter = DetailsLeaguePresenter(NWService: NetworkServic())
         print("sec view did load mmmmmmmmmmm")
        presenter.attachView(view: self)
         print("after attch view did load mmmmmmmmmmm")
        mycollection.dataSource = self
                 mycollection.delegate = self
                     latesteventcollection.delegate=self
                     latesteventcollection.dataSource=self
                     upcommingcollection.delegate=self
                     upcommingcollection.dataSource = self
       print("after source view did load mmmmmmmmmmm")
        presenter.getItems(myidLeag: "4328")
         print("after get item did load mmmmmmmmmmm")
    }
    func stopAnimatingev() {
           
       }
       
       func renderDetailCollectionViewev() {
        print("rendermmmmmmmmmmmmm")
           resultView = presenter.resultev.map({ (myitem) -> String in
               print(myitem.dateEvent, "hiiiiiiiiiiiiiiiiiiiiiiiiii")
               return myitem.dateEvent ?? ""
           })
       }
       
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           if (collectionView == mycollection){
               return 3
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
       
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}