//
//  TeamPresenter.swift
//  Sporty
//
//  Created by  Hager Magdy on 5/17/22.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
class TeamPresenter {
   var resultT : [Team]!  // model
   let network = NetworkServic()

   weak var view : DetailLeagueProtocol?  // DI
    init(NWService : NetworkServiceProtocol){
       }
func attachView(view: DetailLeagueProtocol?){
    self.view = view
}
    func getItemsTeams(strLeague : String){
        var strLeagueNoSpace : String
        strLeagueNoSpace = convertSpcaes(parameters: strLeague)
        network.teamResult(sportTeamLeg: strLeagueNoSpace){[weak self] (result) in
            self?.resultT = result?.teams
        DispatchQueue.main.async {
            self?.view?.stopAnimatingev()
            self?.view?.renderDetailCollectionViewev()
            
        }
    }
    }
    
    func convertSpcaes(parameters : String) -> String{
           let suffix : Set<Character> = ["\r"]
           var newParameters = parameters
           newParameters.removeAll(where: {suffix.contains($0)})
           newParameters = newParameters.trimmingCharacters(in: .newlines)
           return newParameters.replacingOccurrences(of: " ", with: "%20")
       }
}
