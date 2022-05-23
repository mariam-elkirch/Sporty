//
//  YoutubeModel.swift
//  Sporty
//
//  Created by  Hager Magdy on 5/14/22.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
class YouTubeModel: Decodable {
    let items: [Item?]
}

class Item: Decodable{
    let brandingSettings: Settings
}

class Settings: Decodable {
    let channel: Channel
}

class Channel: Decodable {
    let unsubscribedTrailer: String
}
