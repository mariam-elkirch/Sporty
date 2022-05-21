//
//  FavouriteLeague.swift
//  Sporty
//
//  Created by user188930 on 5/21/22.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
class FavourieLeague{

var idLeague : String = ""
var strLeague: String  = ""
var strYoutube : String = ""
var strBadge : String = ""

    init(id:String,name:String,img :String,youtube :String ) {
           self.idLeague = name
              self.strLeague = name
              self.strBadge = img
           self.strYoutube = youtube
          
       }
    init() {
        self.idLeague = ""
        self.strBadge = ""
        self.strLeague = ""
        self.strYoutube = ""
    }
}
