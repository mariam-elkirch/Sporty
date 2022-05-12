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
    
    static func legsResult(strSport : String , complitionHandler : @escaping (SportsModel?) -> Void){
   var strSport = "Soccer"
                 Alamofire.request("https://www.thesportsdb.com/api/v1/json/2/search_all_leagues.php?s=\(strSport)")
                     .response{(responseData) in
    guard let data = responseData.data else {
                        return}
            do {
        let countries = try JSONDecoder().decode(LeagueModel.self, from: data)
            
    print(countries.countries[2].strLeague ?? "noData"  , "")
            }catch {
            print(error)
                        
            }}
    
    
    
}
}
