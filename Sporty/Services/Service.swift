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
  static func sportResult(complitionHandler : @escaping (SportsModel?) -> Void)
    static func legsResult(strSport : String , complitionHandler : @escaping (LeagueModel?) -> Void)
func eventsResult(idLeague : String , complitionHandler : @escaping (Events?) -> Void)
}
    

class NetworkServic : NetworkServiceProtocol {
   
    
    static func sportResult(complitionHandler : @escaping (SportsModel?) -> Void){
        Alamofire.request("https://www.thesportsdb.com/api/v1/json/2/all_sports.php")
        .response{(responseData) in
            guard let data = responseData.data else {
                return}
            do {
            let sports = try JSONDecoder().decode(SportsModel.self, from: data)
               // self.callBack?(countries, true,"")
                 complitionHandler(sports)
                print(sports.sports?[2].strSport ?? "batot"  , "55")
                print("hee")
            } catch {
                print(error)
                complitionHandler(nil)
               // self.callBack?(nil, false, error.localizedDescription)
            }}
    }
    
    static func legsResult(strSport : String , complitionHandler : @escaping (LeagueModel?) -> Void){
        
   //var strSport = "Soccer"
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
     static func teamResult(strLeague : String ,complitionHandler : @escaping (TeamModel?) -> Void){
            
       
                     Alamofire.request(" https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=BTCC")
                      //  \(strLeague)")
                         .response{(responseData) in
        guard let data = responseData.data else {
                            return}
                do {
            let countries = try JSONDecoder().decode(TeamModel.self, from: data)
                complitionHandler(countries)

                    print(countries.teams?[0].strTeamBadge ?? "noData"  , "hh")
                }catch {
                print(error)
                complitionHandler(nil)

                }}
    }
    
    
//    https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=English%20Premier%20League
    
     static func youtubeResult(url : String , complitionHandler : @escaping (YouTubeModel?) -> Void){
            
        Alamofire.request(url).response{(responseData) in
        guard let data = responseData.data else {
            return}
                do {
            let countries = try JSONDecoder().decode(YouTubeModel.self, from: data)
                complitionHandler(countries)

                    print(countries.items[3]?.brandingSettings  ?? "noData"  , "hh")
                }catch {
                print(error)
                complitionHandler(nil)

                }}
        
        
    }
    
    func eventsResult(idLeague : String , complitionHandler : @escaping (Events?) -> Void){
        
   //var strSport = "Soccer"
                 Alamofire.request("https://www.thesportsdb.com/api/v1/json/2/eventsseason.php?id=4617")
                     .response{(responseData) in
    guard let data = responseData.data else {
                        return}
            do {
        let countries = try JSONDecoder().decode(Events.self, from: data)
            complitionHandler(countries)

                print(countries.events[2].idEvent ?? "noData"  , "mmmmmmmmmmmmmmmmmmmmservice")
            }catch {
            print(error)
            complitionHandler(nil)

            }}
}
    
    static func teamResult(complitionHandler : @escaping (TeamModel?) -> Void){
           Alamofire.request("https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?s=Baseball&c=Canada")
           .response{(responseData) in
               guard let data = responseData.data else {
                   return}
               do {
               let countries = try JSONDecoder().decode(TeamModel.self, from: data)
                  // self.callBack?(countries, true,"")
             complitionHandler(countries)
                   print(countries.teams![2].strTeamBadge ,"imagelink")
                   print("teamservice")
               } catch {
                   print(error)
                   complitionHandler(nil)
          // self.callBack?(nil, false, error.localizedDescription)
               }}
       }
    
    
}

