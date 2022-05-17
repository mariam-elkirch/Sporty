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

      internal  var re = [LeagueTwo]()
        
        var youResult : String?
       weak var view : LeagueProtocol!  // DI
        init(NWService : NetworkServiceProtocol){
           }
    func attachView(view: LeagueProtocol){
        self.view = view
    }
        func getItems(sportName : String){
            NetworkServic.legsResult(strSport: sportName){[weak self] (result) in
            print(sportName ,"nameofsportpresenter")
            print(" League presenter")
            
            print(result?.countries[2].idLeague ?? "")
            self?.result = result?.countries
            DispatchQueue.main.async {
                self?.view.stopAnimating()
                self?.view.renderTableView()
                //self.label?.text = result.items[0].header ?? ""
            }
        }
        }//BTCC
         func getTeams(teamName : String){
                   NetworkServic.teamResult(strLeague: teamName){[weak self] (result) in
                   print(teamName ,"nameofsportpresenter")
                   print(" team presenter")
                   
                    print(result?.teams![0].strTeamBadge ?? "noooodata", "teamssspresenterr")
                    self?.result2 = result?.teams
                    DispatchQueue.main.async {
                                  self?.view.stopAnimating()
                                //  self?.view.renderTableView()
                                  //self.label?.text = result.items[0].header ?? ""
                              }
                
               }
               }
        
        
    
         /*   func getYoutube(){
                   var googleAPI = "https://youtube.googleapis.com/youtube/v3/channels?part=brandingSettings&id="
            var youtubeAPI = "&key=AIzaSyAhbFg1NXjD8gcHwO7o83nVz81pH4HwCAY"
                guard let res = result else { return  }
                print(res.count ,"counttt")
                 for index in 0..<self.result!.count{
                    let youTubeURL = self.result![index].strYoutube
                    if(youTubeURL != "" && (youTubeURL.contains("user") || youTubeURL.contains("channel"))){
                                 var url: String!
                    if(youTubeURL.contains("user")){
                url = googleAPI + youTubeURL.split(separator: "/").last! + youtubeAPI
                                }
                               else if(youTubeURL.contains("channel")){
                    url = googleAPI + youTubeURL.split(separator: "/").last! + youtubeAPI
                                 }
                       NetworkServic.youtubeResult(url: "https://youtube.googleapis.com/youtube/v3/channels?part=brandingSettings&id=UC3Guly6AbOr3PqrZMaV6vog&key=AIzaSyAhbFg1NXjD8gcHwO7o83nVz81pH4HwCAY"){[weak self] (resultTwo) in
                        self?.re[0].strYoutube = resultTwo!.items[1]!.brandingSettings.channel.unsubscribedTrailer
                        print(resultTwo!.items[0]?.brandingSettings.channel.unsubscribedTrailer , "youtubeeeee")
        }
        }
        }
    }*/
    }
