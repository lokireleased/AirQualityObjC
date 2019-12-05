//
//  StatesListTableViewController.swift
//  AirQuality
//
//  Created by tyson ericksen on 12/4/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

import UIKit

class StatesListTableViewController: UITableViewController {
    
    var country: String?
    var states: [String] = [] {
        didSet {
            updateViews()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let country = country else { return }
        LBTCityAirQualityController.fetchSupprtedStates(inCountry: country) { (states) in
            if let states = states {
                self.states = states
            }
        }
       
    }

    // MARK: - Table view data source

   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return states.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateCell", for: indexPath)

       let state = states[indexPath.row]
        cell.textLabel?.text = state

        return cell
    }
    

   
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCitiesVC" {
            if let indexPath = tableView.indexPathForSelectedRow {
                if let destinationVC = segue.destination as? CitiesTableViewController {
                    if let country = country {
                        let selectedState = states[indexPath.row]
                        destinationVC.country = country
                        destinationVC.state = selectedState
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
