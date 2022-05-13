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
class ViewController: UIViewController {
     var appdelegate:AppDelegate?
    let indicator = UIActivityIndicatorView(style: .large)
       var presenter : HomePresenter!
       // Modle for View
       var resultView: [String]!
    override func viewDidLoad() {

        super.viewDidLoad()
        print("view did")
              indicator.center = self.view.center
                    self.view.addSubview(indicator)
                    indicator.startAnimating()
                    
                    presenter = HomePresenter(NWService: NetworkServic())
                    presenter.attachView(view: self)
                    
                    presenter.getItems()
                  //  self.table.delegate=self
                      //  self.table.dataSource=self
        // Do any additional setup after loading the view.
    }


}
extension ViewController : HomeProtocol {
    func stopAnimating() {
        indicator.stopAnimating()
        // I have the result
        //presenter.result
    }
    func renderCollectionView(){
        resultView = presenter.result.map({ (item) -> String in
            print("kak")
            print(item.strSport)
        
            return item.strSport ?? ""
        })
        //self.tableView.reloadData()
    }
}


