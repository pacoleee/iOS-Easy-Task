//
//  Coordinate.swift
//  weather
//
//  Created by Paco Lee on 2017-07-26.
//  Copyright © 2017 Paco Lee. All rights reserved.
//

import Foundation
import ObjectMapper

class Coordinate: Mappable {
    
    var longitude: Double?
    var latitude: Double?
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        longitude <- map["lon"]
        latitude <- map["lat"]
    }
    
}
