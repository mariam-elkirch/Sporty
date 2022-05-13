//
//  LeaguePresenter.swift
//  Sporty
//
//  Created by  Hager Magdy on 5/13/22.
//  Copyright © 2022 iti. All rights reserved.
//
import Foundation
    class LeaguePresenter {
    //var NWService : MovieService! // service
       var result : [League]! // model
       weak var view : LeagueProtocol!  // DI
        init(NWService : NetworkServiceProtocol){
           }
    func attachView(view: LeagueProtocol){
        self.view = view
    }
    func getItems(){
        NetworkServic.legsResult(strSport: ""){[weak self] (result) in
            
            print(" League presenter")
            
            print(result?.countries[2].idLeague ?? "")
            self?.result = result?.countries
            //self.tableView.reloadData()
            DispatchQueue.main.async {
                self?.view.stopAnimating()
                self?.view.renderCollectionView()
                //self.label?.text = result.items[0].header ?? ""
            }
        }
    }
}
