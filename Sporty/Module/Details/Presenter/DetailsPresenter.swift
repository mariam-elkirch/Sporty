//
//  DetailsPresenter.swift
//  Sporty
//
//  Created by  Hager Magdy on 5/15/22.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
  class DetailsLeaguePresenter {
    //var NWService : MovieService! // service
       var resultev : [Event]? // model
    var dataModel : LocalDataModel?
       weak var view : DetailLeagueProtocol? // DI
        init(NWService : NetworkServiceProtocol){
           }
    func attachView(view: DetailLeagueProtocol){
        self.view = view
    }
    let network = NetworkServic()
        func getItems(idfromViewLeg : String){
            
          network.eventsResult( myidLeague: idfromViewLeg)
            {[weak self] (result , Error) in
           // print(myidLeag ,"mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmpp")
            print(" League presenter")
            
                print(result?.events[2].idEvent ?? "")
                self?.resultev = result?.events
                
            //self.tableView.reloadData()
            

            DispatchQueue.main.async {
                self?.view?.stopAnimatingev()
                self?.view?.renderDetailCollectionViewev()
                //self.label?.text = result.items[0].header ?? ""
            }
        }
    
    }
    
    func insertData(leg:League){
        dataModel = LocalDataModel()
        dataModel?.Add(leagueInput: leg)
        
    }
    
    
}
