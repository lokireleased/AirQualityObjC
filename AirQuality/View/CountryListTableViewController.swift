//
//  CountryListTableViewController.swift
//  AirQuality
//
//  Created by tyson ericksen on 12/4/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

import UIKit

class CountryListTableViewController: UITableViewController {
    
    var countries: [String] = [] {
        didSet {
            updateViews()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        LBTCityAirQualityController.fetchSupportedCountries { (countries) in
            if let countries = countries {
                self.countries = countries
            }
        }
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return countries.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)

        let country = countries[indexPath.row]
        cell.textLabel?.text = country
       

        return cell
    }
    

  
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toStateVC" {
            if let indexPath = tableView.indexPathForSelectedRow {
                if let destinationVC = seque.destination as? StatesListTableViewController {
                    let selectedCountry = countries[indexPath.row]
                    destinationVC.country = selectedCountry
                
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
