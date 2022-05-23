//
//  ViewController.swift
//  Sporty
//
//  Created by user188930 on 5/11/22.
//  Copyright © 2022 iti. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher
protocol HomeProtocol : AnyObject{
    func stopAnimating()
    func renderCollectionView()
}
class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
   var sportSelect:Array<Sport>=[]
     var appdelegate:AppDelegate?
    let indicator = UIActivityIndicatorView(style: .large)
       var presenter : HomePresenter!
       // Modle for View
       var resultView: [String]!
    
    
    @IBOutlet weak var mycollectionsport: UICollectionView!
    
    
    
    override func viewDidLoad() {

        super.viewDidLoad()
        print("view did")
              indicator.center = self.view.center
                    self.view.addSubview(indicator)
                    indicator.startAnimating()
           // activeViewController.tabBarController.selectedIndex = 1
                    presenter = HomePresenter(NWService: NetworkServic())
        presenter.attachView(view: self)
                    
                    presenter.getItems()
        mycollectionsport.dataSource = self
        mycollectionsport.delegate = self
      mycollectionsport.collectionViewLayout = UICollectionViewFlowLayout()
       
       //
       if let layout = mycollectionsport?.collectionViewLayout as? UICollectionViewFlowLayout{
                layout.minimumLineSpacing = 0
            layout.minimumInteritemSpacing = 0
                layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
              //  let size = CGSize(width:(mycollectionsport!.bounds.width-165)/2, height: 220)
            let size = CGSize(width : mycollectionsport.frame.width * 0.44999 , height: mycollectionsport.frame.height * 0.249)
          // CGSize(width: mycollectionsport.frame.size.width/3.5, height: mycollectionsport.frame.size.height/4)
                layout.itemSize = size
          
            
            
        }
       // mycollectionsport.de
                  //  self.table.delegate=self
                      //  self.table.dataSource=self
        // Do any additional setup after loading the view.
    }

//sportCell
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sportSelect.count
      }
      
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sportCell", for: indexPath) as! SportCollectionViewCell
        let url=URL(string: sportSelect[indexPath.row].strSportThumb ?? "https://pngimage.net/wp-content/uploads/2018/05/courses-png-6.png")
                
        let res=ImageResource(downloadURL: url!)
        cell.imgsport.kf.setImage(with: res, placeholder: UIImage(named: "flower1.jpg"))
                // cell.myimg.kf.setImage(with: res)
                        //cell.s(with: images[indexPath.row])
        cell.sportlabel.text = sportSelect[indexPath.row].strSport
                        return cell
      }
//
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

         if let cell = sender as? UICollectionViewCell,
            let indexPath = mycollectionsport.indexPath(for: cell) {

             let vc = segue.destination as! LeagueViewController //Cast with your DestinationController
             //Now simply set the title property of vc
            vc.sport = sportSelect[indexPath.row].strSport
 
         }
    }
}
    
  
extension ViewController : HomeProtocol  {
    func stopAnimating() {
        indicator.stopAnimating()
        // I have the result
        //presenter.result
    }
    func renderCollectionView(){
        resultView = presenter.result.map({ (item) -> String in
           
           
             self.sportSelect.append(item)
          //  print(sportSelect[1].strSport ?? "")
            return item.strSport ?? ""
        })
        self.mycollectionsport.reloadData()
        //self.tableView.reloadData()
        print(resultView.count , "sportttttttt")
    }
}



