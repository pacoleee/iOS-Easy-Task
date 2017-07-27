//
//  WeatherDetails.swift
//  weather
//
//  Created by Paco Lee on 2017-07-26.
//  Copyright © 2017 Paco Lee. All rights reserved.
//

import Foundation
import ObjectMapper

class WeatherDetails: Mappable {

    var temp: Double?
    var pressure: Double?
    var humidity: Double?
    var tempMin: Double?
    var tempMax: Double?

    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        temp <- map["temp"]
        pressure <- map["pressure"]
        humidity <- map["humidity"]
        tempMin <- map["temp_min"]
        tempMax <- map["temp_max"]
    }
    
}
