//
//  locationTrackerViewController.swift
//  portfolioApp
//
//  Created by Stephenson Ang on 07/10/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit
import GoogleMaps

class locationTrackerViewController: UIViewController, GMSMapViewDelegate {
    
    @IBOutlet weak var mapView: GMSMapView!
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.viewLayout()
        
        self.mapView.delegate = self
        self.mapView.isMyLocationEnabled = true
        self.mapView.settings.myLocationButton = true
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 10
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        
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
        
        print("\(location.coordinate.latitude) -- \(location.coordinate.longitude)")

        let cameraPosition = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude, longitude: location.coordinate.longitude, zoom: 18.0)
        let cameraUpdate = GMSCameraUpdate.setCamera(cameraPosition)
        self.mapView.moveCamera(cameraUpdate)

        self.locationManager.stopUpdatingLocation()
    }

}
