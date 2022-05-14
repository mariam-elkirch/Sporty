//
//  LeagueViewController.swift
//  Sporty
//
//  Created by  Hager Magdy on 5/13/22.
//  Copyright © 2022 iti. All rights reserved.
//

import UIKit


  protocol LeagueProtocol : AnyObject{
        func stopAnimating()
        func renderCollectionView()
    }
   class LeagueViewController: UIViewController {
         var appdelegate:AppDelegate?
        let indicator = UIActivityIndicatorView(style: .large)
           var presenter : LeaguePresenter!
           // Modle for View
           var resultView: [String]!
        override func viewDidLoad() {

            super.viewDidLoad()
            print("view did")
            
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


