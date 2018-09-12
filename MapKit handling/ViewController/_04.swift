//
//  _04.swift
//  MapKit handling
//
//  Created by Taehyeon Han on 2018. 9. 12..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit
import MapKit

class _04: BaseViewController {

    // Center point.
    var center: CLLocationCoordinate2D?
    
    // Generate MKMapView
    lazy var _mapView: MKMapView = {
        let mv = MKMapView(frame: self.view.frame)
        
        // Set the center point in MapView.
        mv.setCenter(center!, animated: true)
        
        // Scale.
        // indicates the domain.
        let mySpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let myRegion: MKCoordinateRegion = MKCoordinateRegionMake(center!, mySpan)
        
        // Added region to MapView.
        mv.region = myRegion
        
        return mv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        center = CLLocationCoordinate2DMake(kDefault_latitude, kDefault_longitude)
        
        // Add mapView on view
        self.view.addSubview(_mapView)
        
        // Generate pins.
        let myPin: MKPointAnnotation = MKPointAnnotation()
        
        // Set the coordinates.
        myPin.coordinate = center!
        
        // Set the title.
        myPin.title = "title"
        
        // Set subtitle.
        myPin.subtitle = "subtitle"
        
        // Added pins to MapView.
        _mapView.addAnnotation(myPin)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
