//
//  LeagueViewController.swift
//  Sporty
//
//  Created by  Hager Magdy on 5/13/22.
//  Copyright © 2022 iti. All rights reserved.
//

import UIKit
import Kingfisher
  protocol LeagueProtocol : AnyObject{
        func stopAnimating()
        func renderTableView()
    }
   class LeagueViewController: UIViewController
   ,UITableViewDelegate,UITableViewDataSource {
    var urlSelected : String?
    var sport : String?
    var legueSelect:Array<League>=[]
         var appdelegate:AppDelegate?
        let indicator = UIActivityIndicatorView(style: .large)
           var presenter : LeaguePresenter!
           // Modle for View
    @IBOutlet weak var table: UITableView!
    var resultView: [String]!
        override func viewDidLoad() {
            super.viewDidLoad()
            print("view did")

            
                  indicator.center = self.view.center
                        self.view.addSubview(indicator)
                        indicator.startAnimating()
                        

            indicator.center = self.view.center
            self.view.addSubview(indicator)
            indicator.startAnimating()

                        presenter = LeaguePresenter(NWService: NetworkServic())
                        presenter.attachView(view: self)
                        presenter.getItems(sportName: sport!)

                self.table.delegate=self
            self.table.dataSource=self
            // Do any additional setup after loading the view.
        }
  
    func tableView (_ tableView : UITableView ,heightForRowAt heightForRowAtIndexPath: IndexPath) -> CGFloat{
        return 100
        }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            var c: Int?
                c = legueSelect.count
        //print(resultView.count ?? 5)
            return c!
          }
          func numberOfSections(in tableView: UITableView) -> Int {
              return 1
          }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyCustomCellTableViewCell

            cell.myLabel.text = legueSelect[indexPath.row].strLeague
            print(legueSelect[indexPath.row].strLeague , "haaaaggggg")
    let url=URL(string:self.legueSelect[indexPath.row].strBadge)!
            let res=ImageResource(downloadURL:url)

    cell.imageView?.kf.setImage(with: res, placeholder: UIImage(named: "nemo.jpg"))
            
          cell.imageView?.layer.cornerRadius = (cell.imageView?.frame.size.width)!/2
          cell.imageView?.layer.masksToBounds = true
            cell.imageView?.layer.borderWidth = 2
            cell.myBtn.tag = indexPath.row
            cell.myBtn.addTarget(self, action: #selector(openYoutube(sender: )), for: .touchUpInside)
            urlSelected = legueSelect[indexPath.row].strYoutube
//           urlSelected =  passLink(link: legueSelect[indexPath.row].strYoutube )
            return cell
        }
//    func passLink( link : String) -> String {
//        return link
//    }
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
    }

    extension LeagueViewController : LeagueProtocol {
        func stopAnimating() {
            indicator.stopAnimating()
            // I have the result
            //presenter.result
        }
        func renderTableView(){
            resultView = presenter.result.map({ (item) -> String in
            presenter.getItems(sportName: sport ?? "Soceer")
                print(item.idLeague , "presenter done")
                self.legueSelect.append(item)
                return item.idLeague ?? ""
            })
            self.table.reloadData()
        }
    }


