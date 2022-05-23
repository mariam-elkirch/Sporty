//
//  LeaguePresenter.swift
//  Sporty
//
//  Created by  Hager Magdy on 5/13/22.
//  Copyright © 2022 iti. All rights reserved.
//
import Foundation
    class LeaguePresenter {
       var result : [League]? // model
        var result2 : [Team]? // model
        let network = NetworkServic()

      internal  var re = [LeagueTwo]()
        
        var youResult : String?
       weak var view : LeagueProtocol?  // DI
        init(NWService : NetworkServiceProtocol){
           }
    func attachView(view: LeagueProtocol){
        self.view = view
    }
        func getItems(sportName : String){
            network.legsResult(strSport: sportName){[weak self] (result) in
            print(sportName ,"nameofsportpresenter")
            print(" League presenter")
            print(result?.countries[2].idLeague ?? "")
            self?.result = result?.countries
                print(result?.countries.count , "count of Leagues")
            DispatchQueue.main.async{
                self?.view?.stopAnimating()
                self?.view?.renderTableView()
            }
        }
        }         
    }
