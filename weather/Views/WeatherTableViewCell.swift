//
//  WeatherTableViewCell.swift
//  weather
//
//  Created by Paco Lee on 2017-07-26.
//  Copyright © 2017 Paco Lee. All rights reserved.
//

import UIKit
import SDWebImage

class WeatherTableViewCell: UITableViewCell {
    static let identifier = "WeatherTableViewCell"

    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var tempMinLabel: UILabel!
    @IBOutlet var tempMaxLabel: UILabel!
    
    private var city: City!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func config(_ city: City) {
        self.city = city
        
        cityLabel.text = city.name
        
        if let temp = city.weatherDetails?.temp {
            tempLabel.text = "Temp: \(temp)°C"
        } else {
            tempLabel.text = "Temp: N/A"
        }
        
        if let temp = city.weatherDetails?.temp {
            tempLabel.text = "Temp: \(temp)°C"
        } else {
            tempLabel.text = "Temp: N/A"
        }
        
        if let tempMin = city.weatherDetails?.tempMin {
            tempMinLabel.text = "Temp Min: \(tempMin)°C"
        } else {
            tempMinLabel.text = "Temp Min: N/A"
        }
        
        if let tempMax = city.weatherDetails?.tempMax {
            tempMaxLabel.text = "Temp Max: \(tempMax)°C"
        } else {
            tempMaxLabel.text = "Temp Max: N/A"
        }
        
        if let photoURL = city.photoURL.urlWithEncoding() {
            cityImageView.sd_setImage(with: photoURL, placeholderImage: UIImage())
        }
    }
    
    private func setupUI() {
        selectionStyle = .none
        cityImageView.round(cornerRadius: 4.0)
    }
}
