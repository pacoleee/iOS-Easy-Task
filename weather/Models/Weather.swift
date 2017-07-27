//
//  Weather.swift
//  weather
//
//  Created by Paco Lee on 2017-07-26.
//  Copyright © 2017 Paco Lee. All rights reserved.
//

import Foundation
import ObjectMapper

class Weather: Mappable {

    var main: String?
    var description: String?
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        main <- map["main"]
        description <- map["description"]
    }
    
}
