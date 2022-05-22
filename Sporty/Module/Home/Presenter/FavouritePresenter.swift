//
//  FavouritePresenter.swift
//  Sporty
//
//  Created by user188930 on 5/21/22.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
 class FavouritePresenter {
   
       var resultLeagueCoreData : [FavourieLeague]! // model
    
     var coreData : LocalDataModel?
     weak var view : FavouriteLeaguesControllerProtocol!
    
    init() {
        coreData = LocalDataModel()
    }
   
    func attachView(view: FavouriteLeaguesControllerProtocol){
          self.view = view
      }
    func fetchLeaguesFromCoreData() -> [FavourieLeague]  {
       
        resultLeagueCoreData = coreData?.fetchLeagues()
         print("fetchhhh :\(resultLeagueCoreData.count)")
        //self.view.displayFavouriteLeagues()
           return resultLeagueCoreData
        }
    }


