//
//  Wind.swift
//  weather
//
//  Created by Paco Lee on 2017-07-26.
//  Copyright © 2017 Paco Lee. All rights reserved.
//

import Foundation
import ObjectMapper

class Wind: Mappable {
    
    var speed: Double?
    var degree: Double?
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        speed <- map["speed"]
        degree <- map["deg"]
    }
}
