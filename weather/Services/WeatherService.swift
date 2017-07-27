//
//  WeatherService.swift
//  weather
//
//  Created by Paco Lee on 2017-07-26.
//  Copyright © 2017 Paco Lee. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class WeatherService {
    static let shared = WeatherService()
    private let appID = "8032fefc4d33d74ac7adf1f100d55efd"
    private let baseURL = "http://api.openweathermap.org/data/2.5/weather"
    private let units = "metric"
    
    func getWeather(_ cityName: String, completion: @escaping (_ city: City?) -> Void) {
        guard let cityName = cityName.stringWithEncoding() else  {
            return
        }
        
        let url = "\(baseURL)?q=\(cityName)&units=\(units)&appid=\(appID)"
        Alamofire.request(url).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let json = JSON(value).dictionaryObject  {
                    let city = City(JSON: json)
                    completion(city)
                } else {
                    completion(nil)
                }
            case .failure:
                completion(nil)
            }
        }
    }
}
