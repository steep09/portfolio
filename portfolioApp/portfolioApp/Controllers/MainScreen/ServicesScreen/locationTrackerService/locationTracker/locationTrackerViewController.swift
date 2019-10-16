//
//  locationTrackerViewController.swift
//  portfolioApp
//
//  Created by Stephenson Ang on 07/10/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit
import GoogleMaps

class locationTrackerViewController: UIViewController {
    
    @IBOutlet weak var mapView: GMSMapView!
    
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.viewLayout()
        
        self.mapView.delegate = self as? GMSMapViewDelegate
        self.mapView.isMyLocationEnabled = true
        
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 10
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        
        self.locationManager.startUpdatingLocation()
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func finishTrackingBtnWasPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
extension locationTrackerViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last!
        
        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude, longitude: location.coordinate.longitude, zoom: 10.0)
        self.mapView.animate(to: camera)
        
        self.locationManager.stopUpdatingLocation()
    }
    
}
