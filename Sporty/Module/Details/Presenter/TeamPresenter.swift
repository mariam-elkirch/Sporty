//
//  TeamPresenter.swift
//  Sporty
//
//  Created by  Hager Magdy on 5/17/22.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
class TeamPresenter {
   var resultT : [Team]?  // model
   
   weak var view : DetailLeagueProtocol?  // DI
    init(NWService : NetworkServiceProtocol){
       }
func attachView(view: DetailLeagueProtocol?){
    self.view = view
}
    func getItemsTeams(sportName : String){
        NetworkServic.teamResult{[weak self] (result) in
        print(sportName,"nameofteampresenter")
        print("team presenter")
         print(result?.teams?[0].strTeamBadge ?? "noodata", "teamssspresenterr")
            self?.resultT = result?.teams
        DispatchQueue.main.async {
            self?.view?.stopAnimatingev()
            self?.view?.renderDetailCollectionViewev()
            //self.label?.text = result.items[0].header ?? ""
        }
    }
    }
}
