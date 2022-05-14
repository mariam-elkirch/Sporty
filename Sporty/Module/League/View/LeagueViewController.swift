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
                        
                        presenter.getItems()
                      //  self.table.delegate=self
                          //  self.table.dataSource=self
            // Do any additional setup after loading the view.
        }


    }

    extension LeagueViewController : LeagueProtocol {
        func stopAnimating() {
            indicator.stopAnimating()
            // I have the result
            //presenter.result
        }
        func renderCollectionView(){
            resultView = presenter.result.map({ (item) -> String in
                print("kak")
                print(item.idLeague)
            
                return item.idLeague ?? ""
            })
            //self.tableView.reloadData()
        }
    }


