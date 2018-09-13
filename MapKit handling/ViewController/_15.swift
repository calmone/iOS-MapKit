//
//  _15.swift
//  MapKit handling
//
//  Created by Taehyeon Han on 2018. 9. 12..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit
import MapKit

class _15: BaseViewController {
    
    var center: CLLocationCoordinate2D!
    var _pin: MKPointAnnotation!

    // Generate mapView
    lazy var _mapView: MKMapView = {
        let mv = MKMapView(frame: self.view.frame)

        center = CLLocationCoordinate2DMake(kDefault_latitude, kDefault_longitude)

        mv.centerCoordinate = center

        // Set the center point in MapView.
        mv.setCenter(center, animated: true)

        // Specify the scale (display area).
        let mySpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let myRegion = MKCoordinateRegionMake(center, mySpan)

        // Added region to MapView.
        mv.region = myRegion

        return mv
    }()

    // Generate button
    lazy var _button: UIButton = {
        let b = UIButton(frame: CGRect(x: 0, y: kDefault_height, width: 200, height: 50))
        b.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height-150)
        b.layer.masksToBounds = true
        b.layer.cornerRadius = 20.0
        b.setTitle("GeoCoding", for: .normal)
        b.backgroundColor = UIColor.red
        b.setTitleColor(UIColor.white, for: .normal)
        b.addTarget(self, action: #selector(onClickButton(_:)), for: .touchUpInside)

        return b
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add mapView on view
        self.view.addSubview(_mapView)
        
        // Add button on view
        self.view.addSubview(_button)
        
        // Create pin annotation.
        _pin = MKPointAnnotation()
        _pin.title = "Latitude"
        _pin.subtitle = "Longitude"
        _pin.coordinate = center
        
        // Add annotation to mapView.
        _mapView.addAnnotation(_pin)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc private func onClickButton(_ sender: UIButton) {
        // Create geocoder.
        let myGeocoder: CLGeocoder = CLGeocoder()
        
        // Address to search for.
        let myAddress: String = "1 Infinite Loop, Cupertino, CA, USA"
        
        // start positive geocoding
        myGeocoder.geocodeAddressString(myAddress, completionHandler: { (placemarks, error) -> Void in
            
            for placemark in placemarks! {
                // Assign placemark.location as CLLocation to location
                let location: CLLocation = placemark.location!
                print("Latitude: \(location.coordinate.latitude)")
                print("Longitude: \(location.coordinate.longitude)")
                
                // Set the latitude and longitude to the title and subtitle of the annotation respectively.
                self._pin.title = "\(location.coordinate.latitude)"
                self._pin.subtitle = "\(location.coordinate.longitude)"
            }
        })
    }
    
}
