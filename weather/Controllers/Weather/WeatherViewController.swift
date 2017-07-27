//
//  WeatherViewController.swift
//  weather
//
//  Created by Paco Lee on 2017-07-26.
//  Copyright © 2017 Paco Lee. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    static let identifier = "WeatherViewController"
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchTextField: UITextField!
    
    var cities = [City]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        setupSearchTextField()
        setupTableView()
        getWeather(cityName: "Houston")
    }
    
    private func setupSearchTextField() {
        searchTextField.placeholder = "Enter a city"
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: WeatherTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: WeatherTableViewCell.identifier)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 282
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
    }
    
    fileprivate func getWeather(cityName: String) {
        WeatherService.shared.getWeather(cityName) { (city) in
            if let city = city {
                self.getPhoto(city)
            }
        }
    }
    
    fileprivate func getPhoto(_ city: City) {
        if let coordinate = city.coordinate {
            PhotoService.shared.getPhoto(coordinate) { (photoURL) in
                city.photoURL = photoURL
                self.cities.insert(city, at: 0)
                self.tableView.reloadData()
            }
        }
    }

    @IBAction func searchAction(_ sender: Any) {
        guard let text = searchTextField.text, !text.isEmpty else {
            return
        }
        
        view.endEditing(true)
        getWeather(cityName: text)
    }
}

extension WeatherViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Weather", bundle: nil).instantiateViewController(withIdentifier: WeatherDetailsViewController.identifier) as! WeatherDetailsViewController
        vc.config(cities[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension WeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection  section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as! WeatherTableViewCell
        let city = cities[indexPath.row]
        cell.config(city)
        return cell
    }
}
