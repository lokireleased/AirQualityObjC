//
//  CitiesTableViewController.swift
//  AirQuality
//
//  Created by tyson ericksen on 12/4/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

import UIKit

class CitiesTableViewController: UITableViewController {
    
    var state: String?
    var country: String?
    var cities: [String] = [] {
        didSet {
            updateViews()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let state = state, let country = country else { return }
        LBTCityAirQualityController.fetchSupportedCities(inState: state, country: country) { (cities) in
            if let cities = cities {
                self.cities = cities
            }
        }

    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cities.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)

        let city = cities[indexPath.row]
        cell.textLabel?.text = city
       

        return cell
    }
    

   
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCityDetailsVC" {
            if let indextPath = tableView.indexPathForSelectedRow {
                if let country = country, let state = state {
                    if let destinationVC = segue.destination as? CityDetailViewController {
                        let selectedCity = cities[indexPath.row]
                        destinationVC.city = selectedCity
                        destinationVC.state = state
                        destinationVC.country = country
                    }
                }
            }
        }
    }
    
    func updateViews() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

}
