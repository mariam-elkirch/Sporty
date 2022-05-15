//
//  DetailsLeaguePresenter.swift
//  Sporty
//
//  Created by user188930 on 5/15/22.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
class DetailsLeaguePresenter {
    //var NWService : MovieService! // service
       var result : [Event]! // model
       weak var view : DetailLeagueProtocol!  // DI
        init(NWService : NetworkServiceProtocol){
           }
    func attachView(view: DetailLeagueProtocol){
        self.view = view
    }
        func getItems(myidLeag : String){
            NetworkServic.eventsResult(idLeague: myidLeag)
            {[weak self] (result) in
            print(myidLeag ,"nameofsportpresenter")
            print(" League presenter")
            
                print(result?.events[2].idLeague ?? "")
                self?.result = result?.events
                
            //self.tableView.reloadData()
            

            DispatchQueue.main.async {
                self?.view.stopAnimating()
                self?.view.renderDetailCollectionView()
                //self.label?.text = result.items[0].header ?? ""
            }
        }
    
    }
    
}
