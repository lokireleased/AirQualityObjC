//
//  CityDetailViewController.swift
//  AirQuality
//
//  Created by tyson ericksen on 12/4/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

import UIKit

class CityDetailViewController: UIViewController {
    
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var aqiLabel: UILabel!
    

    var country: String?
    var state: String?
    var city: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let city = city, let state = state, let country = country else { return }
        
        LBTCityAirQualityController.fetchData(forCity: city state: state country: country) { (cityDetails) in
            if let details = cityDetails {
                self.updateViews(with: details)
            }
            
        }
      
    }
    
    func updateViews(with details: LBTCityAirQuality) {
        DispatchQueue.main.async {
            self.cityNameLabel.text = details.city
            self.stateLabel.text = details.state
            self.countryLabel.text = details.country
            self.aqiLabel.text = "\(details.pollution.airQualityIndex)"
            self.windSpeedLabel.text = "\(details.weather.windspeed)"
            self.temperatureLabel.text = "\(details.weather.temperature)"
            self.humidityLabel.text = "\(details.weather.humidity)"
        }
    }

    
}
