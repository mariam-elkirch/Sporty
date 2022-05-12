//
//  Sport.swift
//  Sporty
//
//  Created by user188930 on 5/12/22.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
class Sport: Codable {
    public var strSport: String?
    public var strSportThumb: String?
    
    enum CodingKeys: String, CodingKey {
        case strSport = "strSport"
        case strSportThumb = "strSportThumb"
    }
}
