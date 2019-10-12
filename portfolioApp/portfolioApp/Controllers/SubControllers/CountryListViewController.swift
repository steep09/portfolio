//
//  CountryListViewController.swift
//  portfolioApp
//
//  Created by Stephenson Ang on 10/11/19.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit

class CountryListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var country = [Country]()
    
    var signUpVC = SignUpViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        parseJson(urlToString: "https://restcountries.eu/rest/v2/all")
        
    }
    
    func parseJson(urlToString: String) {
        
        let url = URL(string: urlToString)
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            do {
                if error == nil {
                    self.country = try JSONDecoder().decode([Country].self, from: data!)
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            } catch {
                print("Error parsing JSON \(error)")
            }
        }.resume()
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension CountryListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return country.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryListCell", for: indexPath) as! countryListCell
        
        let countries = country[indexPath.row]
        
        cell.countryName.text = countries.name
        cell.countryCode.text = "+\(countries.callingCodes[0])"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let countryCode = country[indexPath.row]
        countryCodeString = "+\(countryCode.callingCodes[0])"
        print("---\(countryCodeString ?? "+63")")
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
