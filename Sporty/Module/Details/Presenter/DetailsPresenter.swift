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

       weak var view : DetailLeagueProtocol? // DI
        init(NWService : NetworkServiceProtocol){
           }
    func attachView(view: DetailLeagueProtocol){
        self.view = view
    }
    let network = NetworkServic()
        func getItems(myidLeag : String){
            
          network.eventsResult(idLeague: myidLeag)
            {[weak self] (result) in
            print(myidLeag ,"mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmpp")
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
    
    
    
    
}
