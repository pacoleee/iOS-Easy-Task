//
//  WeatherDetailsViewController.swift
//  weather
//
//  Created by Paco Lee on 2017-07-26.
//  Copyright © 2017 Paco Lee. All rights reserved.
//

import UIKit

class WeatherDetailsViewController: UIViewController {
    static let identifier = "WeatherDetailsViewController"

    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var longitudeLabel: UILabel!
    @IBOutlet var latitudeLabel: UILabel!
    @IBOutlet var weatherLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var tempMinLabel: UILabel!
    @IBOutlet var tempMaxLabel: UILabel!
    @IBOutlet var pressureLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!
    @IBOutlet var speedLabel: UILabel!
    @IBOutlet var degreeLabel: UILabel!

    private var city: City!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func config(_ city: City) {
        self.city = city
    }
    
    private func setup() {
        setupUI()
        setupView()
        setupCityImageView()
    }
    
    private func setupUI() {
        cityImageView.round(cornerRadius: 4.0)
    }
    
    private func setupView() {
        title = city.name
        cityNameLabel.text = city.name
        
        if let longitude = city.coordinate?.longitude {
            longitudeLabel.text = "Longitude: \(longitude)"
        } else {
            longitudeLabel.text = "Longitude: N/A"
        }
        
        if let latitude = city.coordinate?.latitude {
            latitudeLabel.text = "latitude: \(latitude)"
        } else {
            latitudeLabel.text = "latitude: N/A"
        }
        
        weatherLabel.text = city.weather?[0].main
        descriptionLabel.text = city.weather?[0].description
        
        if let temp = city.weatherDetails?.temp {
            tempLabel.text = "Temp: \(temp)"
        } else {
            tempLabel.text = "Temp: N/A"
        }
        
        if let tempMin = city.weatherDetails?.tempMin {
            tempMinLabel.text = "Temp Min: \(tempMin)°C"
        } else {
            tempMinLabel.text = "Temp: N/A"
        }
        if let tempMax = city.weatherDetails?.tempMax {
            tempMaxLabel.text = "Temp Max: \(tempMax)°C"
        } else {
            tempMaxLabel.text = "Temp Max: N/A"
        }
        if let pressure = city.weatherDetails?.pressure {
            pressureLabel.text = "Pressure: \(pressure)°C"
        } else {
            pressureLabel.text = "Pressure: N/A"
        }
        
        if let humidity = city.weatherDetails?.humidity {
            humidityLabel.text = "Humidity: \(humidity)%"
        } else {
            humidityLabel.text = "Humidity: N/A"
        }
        
        if let degree = city.wind?.degree{
            degreeLabel.text = "Degree: \(degree)°"
        } else {
            degreeLabel.text = "Degree: N/A"
        }
        
        if let speed = city.wind?.speed{
            speedLabel.text = "Speed: \(speed) km/h"
        } else {
            speedLabel.text = "Speed: N/A"
        }
        
        if let photoURL = city.photoURL.urlWithEncoding() {
            cityImageView.sd_setImage(with: photoURL, placeholderImage: UIImage())
        }
    }
    
    private func setupCityImageView() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(cityImageViewTapped(tapGestureRecognizer:)))
        cityImageView.isUserInteractionEnabled = true
        cityImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func cityImageViewTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        if let image = cityImageView.image {
            let vc = UIStoryboard(name: "Weather", bundle: nil).instantiateViewController(withIdentifier: PhotographDetailViewController.identifier) as! PhotographDetailViewController
            vc.config(image: image)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
