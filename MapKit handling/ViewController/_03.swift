//
//  _03.swift
//  MapKit handling
//
//  Created by Taehyeon Han on 2018. 9. 12..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class _03: BaseViewController {
    
    // Generate MKMapView
    lazy var _mapView: MKMapView = {
        let mv = MKMapView(frame: self.view.frame)
        mv.delegate = self
        
        return mv
    }()
    
    // Generate CLLocationManager
    lazy var _locationManager: CLLocationManager = {
        let lm = CLLocationManager()
        
        lm.delegate = self
        // Distance filter.
        lm.distanceFilter = 100.0
        // accuracy.
        lm.desiredAccuracy = kCLLocationAccuracyHundredMeters
        
        return lm
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Obtain the status of security authentication.
        let status = CLLocationManager.authorizationStatus()
        
        // If authentication has not been obtained yet, an authentication dialog is displayed.
        if(status != CLAuthorizationStatus.authorizedWhenInUse) {
            print("not determined")
            // If the approval has not been obtained yet, an authentication dialog is displayed.
            _locationManager.requestWhenInUseAuthorization()
        }
        
        // Add mapView on view
        self.view.addSubview(_mapView)
        
        // latitude and longitude of the center point.
        let myCoordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(kDefault_latitude, kDefault_longitude)
        
        // Scale.
        let myLatDist : CLLocationDistance = 100
        let myLonDist : CLLocationDistance = 100
        
        // Create Region.
        let myRegion: MKCoordinateRegion = MKCoordinateRegionMakeWithDistance(myCoordinate, myLatDist, myLonDist);
        
        // Reflected in MapView.
        _mapView.setRegion(myRegion, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension _03: MKMapViewDelegate, CLLocationManagerDelegate {
    
    // Method called when getting a value from GPS.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("didUpdateLocations")
        
        // Get the current coordinates from the array.
        let myLastLocation: CLLocation = locations.last!
        let myLocation: CLLocationCoordinate2D = myLastLocation.coordinate
        
        print("\(myLocation.latitude), \(myLocation.longitude)")
        
        // Scale.
        let myLatDist : CLLocationDistance = 100
        let myLonDist : CLLocationDistance = 100
        
        // Create Region.
        let myRegion: MKCoordinateRegion = MKCoordinateRegionMakeWithDistance(myLocation, myLatDist, myLonDist);
        
        // Reflected in MapView.
        _mapView.setRegion(myRegion, animated: true)
    }
    
    // Method called when the Region changes.
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print("regionDidChangeAnimated")
    }
    
    // Method called when authentication changes.
    private func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse: print("AuthorizedWhenInUse")
        case .authorized: print("Authorized")
        case .denied: print("Denied")
        case .restricted: print("Restricted")
        case .notDetermined: print("NotDetermined")
        case .authorizedAlways: print("authorizedAlways")
        }
    }
    
}
