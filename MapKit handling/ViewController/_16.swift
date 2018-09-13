//
//  _16.swift
//  MapKit handling
//
//  Created by Taehyeon Han on 2018. 9. 12..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit
import MapKit

class _16: BaseViewController {
    
    var center: CLLocationCoordinate2D!
    var _pin: MKPointAnnotation!
    
    // Generate mapView
    lazy var _mapView: MKMapView = {
        let mv = MKMapView(frame: self.view.frame)
        
        center = CLLocationCoordinate2DMake(kDefault_latitude, kDefault_longitude)
        
        mv.centerCoordinate = center
        
        // Change the scale.
        // Specify magnification.
        let span : MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        
        // Specify the center position specified in MapView and the span declared with MKCoordinateSapn.
        let region : MKCoordinateRegion = MKCoordinateRegion(center: center, span: span)
        
        // Specify region as the region property of MapView.
        mv.region = region
        
        return mv
    }()
    
    // Generate button
    lazy var _button: UIButton = {
        let b = UIButton(frame: CGRect(x: 0, y: kDefault_height, width: 200, height: 50))
        b.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height-150)
        b.layer.masksToBounds = true
        b.layer.cornerRadius = 20.0
        b.setTitle("ReverseGeoCoding", for: .normal)
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
        _pin.coordinate = center
        _pin.title = "Country"
        _pin.subtitle = "Name"
        
        // Add annotation to mapView.
        _mapView.addAnnotation(_pin)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc private func onClickButton(_ sender: UIButton) {
        // Create geocoder.
        let myGeocorder = CLGeocoder()
        
        // Create a location.
        let myLocation = CLLocation(latitude: kDefault_latitude, longitude: kDefault_longitude)
        
        // Start reverse geocoding.
        myGeocorder.reverseGeocodeLocation(myLocation, completionHandler: { (placemarks, error) -> Void in
            
            for placemark in placemarks! {
                
                print("Name: \(placemark.name ?? "Empty")")
                print("Country: \(placemark.country ?? "Empty")")
                print("ISOcountryCode: \(placemark.isoCountryCode ?? "Empty")")
                print("administrativeArea: \(placemark.administrativeArea ?? "Empty")")
                print("subAdministrativeArea: \(placemark.subAdministrativeArea ?? "Empty")")
                print("Locality: \(placemark.locality ?? "Empty")")
                print("PostalCode: \(placemark.postalCode ?? "Empty")")
                print("areaOfInterest: \(placemark.areasOfInterest ?? ["Empty"])")
                print("Ocean: \(placemark.ocean ?? "Empty")")
                
                // Change the title and subtitle of pin.
                self._pin.title = "\(placemark.country ?? "Empty")"
                self._pin.subtitle = "\(placemark.name ?? "Empty")"
            }
        })
    }
    
}
