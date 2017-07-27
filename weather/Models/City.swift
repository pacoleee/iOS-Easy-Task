//
//  City.swift
//  weather
//
//  Created by Paco Lee on 2017-07-26.
//  Copyright © 2017 Paco Lee. All rights reserved.
//

import Foundation
import ObjectMapper

class City: Mappable {
    
    var name: String?
    var coordinate: Coordinate?
    var weather: [Weather]?
    var weatherDetails: WeatherDetails?
    var wind: Wind?
    var photoURL: String?
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        name <- map["name"]
        coordinate <- map["coord"]
        weather <- map["weather"]
        weatherDetails <- map["main"]
        wind <- map["wind"]
    }
    
}
