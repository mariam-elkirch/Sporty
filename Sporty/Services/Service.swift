//
//  Service.swift
//  Sporty
//
//  Created by user188930 on 5/12/22.
//  Copyright © 2022 iti. All rights reserved.
//
import Foundation
import  Alamofire
protocol NetworkServiceProtocol{
 func sportResult(complitionHandler : @escaping (SportsModel?) -> Void)
     func legsResult(strSport : String , complitionHandler : @escaping (LeagueModel?) -> Void)
 func eventsResult(myidLeague : String , complitionHandler : @escaping (Events?, Error?) -> Void)
     func teamResult(sportTeamLeg : String ,  complitionHandler : @escaping (TeamModel?) -> Void)
}
    

class NetworkServic : NetworkServiceProtocol {
   
    
    func sportResult(complitionHandler : @escaping (SportsModel?) -> Void){
        Alamofire.request("https://www.thesportsdb.com/api/v1/json/2/all_sports.php")
        .response{(responseData) in
            guard let data = responseData.data else {
                return}
            do {
            let sports = try JSONDecoder().decode(SportsModel.self, from: data)
                 complitionHandler(sports)
                print(sports.sports?[2].strSport ?? "batot"  , "55")
                print("hee")
            } catch {
                print(error)
                complitionHandler(nil)
               
            }}
    }
    
     func legsResult(strSport : String , complitionHandler : @escaping (LeagueModel?) -> Void){
        
                 Alamofire.request("https://www.thesportsdb.com/api/v1/json/2/search_all_leagues.php?s=\(strSport)")
                     .response{(responseData) in
    guard let data = responseData.data else {
                        return}
            do {
        let countries = try JSONDecoder().decode(LeagueModel.self, from: data)
            complitionHandler(countries)

    print(countries.countries[2].strLeague ?? "noData"  , "hh")
            }catch {
            print(error)
            complitionHandler(nil)

            }}
}
    
   func eventsResult(myidLeague : String , complitionHandler : @escaping (Events?, Error?) -> Void) {

    print("getLeaguesLatestEvents from network")

            let parameters = ["id" : myidLeague] as [String : String]
           Alamofire.request("https://www.thesportsdb.com/api/v1/json/2/eventsseason.php?", parameters: parameters ).responseJSON(completionHandler: { (response) in
               switch response.result{
                  case .success(_):
                 guard let data = response.data else {
               return
               }
              print("getLeaguesLatestEvents from network\(data)")



             do{
            let result = try JSONDecoder().decode(Events.self, from: data)
             print("from Network latest : \(String(describing: result.events.count))")
             complitionHandler(result, nil)
            }
           catch{}
              case .failure(_):
            print("from network leatest error")
           }
            })
               }
     func teamResult(sportTeamLeg : String ,  complitionHandler : @escaping (TeamModel?) -> Void){

            print(sportTeamLeg ,"strSport Inside serviceeeee")
           Alamofire.request("https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=\(sportTeamLeg)")

           .response{(responseData) in
               guard let data = responseData.data else {
                   return}
               do {
               let countries = try JSONDecoder().decode(TeamModel.self, from: data)
             complitionHandler(countries)
            
                   print("teamservice")
               } catch {
                   print(error)
                   complitionHandler(nil)
               }}
        }
    
       }
