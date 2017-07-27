//
//  PhotoService.swift
//  weather
//
//  Created by Paco Lee on 2017-07-26.
//  Copyright © 2017 Paco Lee. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class PhotoService {
    static let shared = PhotoService()
    private let apiKey = "AIzaSyDKBwCwI43mnzI7pyW3h5E3ENqJtP9CyjY"
    private let baseURL = "https://maps.googleapis.com/maps/api/place/"
    private let radius = "500"
    
    
    func getPhoto(_ coordinate: Coordinate, completion: @escaping (_ photoReference: String?) -> Void) {
        guard let latitude = coordinate.latitude, let longitude = coordinate.longitude else {
            return
        }
        
        let url = "\(baseURL)nearbysearch/json?location=\(latitude),\(longitude)&radius=\(radius)&key=\(apiKey)"
        Alamofire.request(url).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let json = JSON(value).dictionaryObject, let results = json["results"] as? [Any], let result = results[0] as? [String: AnyObject], let photos = result["photos"] as? [Any], let photo = photos[0] as? [String: AnyObject], let photoReference = photo["photo_reference"] as? String {
                    let photoURL = "\(self.baseURL)photo?maxwidth=375&photoreference=\(photoReference)&key=\(self.apiKey)"
                    completion(photoURL)
                } else {
                    completion(nil)
                }
            case .failure:
                completion(nil)
            }
        }
    }
}
