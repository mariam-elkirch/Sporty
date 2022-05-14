//
//  Team.swift
//  Sporty
//
//  Created by  Hager Magdy on 5/14/22.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
class Team : Codable {
    public var strTeamBadge: String?
    enum CodingKeys: String, CodingKey {
        case strTeamBadge = "strTeamBadge"
    }
}
