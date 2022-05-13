//
//  HomePresenter.swift
//  Sporty
//
//  Created by user188930 on 5/13/22.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation

    class HomePresenter {
    //var NWService : MovieService! // service
       var result : [Sport]! // model
       weak var view : HomeProtocol!  // DI
        init(NWService : NetworkServiceProtocol){
            
           }
    func attachView(view: HomeProtocol){
        self.view = view
    }
    func getItems(){
        NetworkServic.sportResult{[weak self] (result) in
            print("presenter")
           // print(result?.sports?[2].strSport ?? "")
           // print(result?.items[0].title ?? "")
            self?.result = result?.sports
            //self.tableView.reloadData()
            DispatchQueue.main.async {
                self?.view.stopAnimating()
                self?.view.renderCollectionView()
                //self.label?.text = result.items[0].header ?? ""
            }
        }
    }

}
