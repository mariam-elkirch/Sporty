//
//  InternetConnection.swift
//  Sporty
//
//  Created by user188930 on 5/22/22.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
import Alamofire
class Connectivity {
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
