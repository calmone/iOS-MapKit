//
//  _11.swift
//  MapKit handling
//
//  Created by Taehyeon Han on 2018. 9. 12..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit
import MapKit

class _11: BaseViewController {
    
    // Create an array to display.
    let mapTypes: [String] = ["Standard", "Hybrid", "Satellite"]
    
    // Generate MKMapView
    lazy var _mapView: MKMapView = {
        let mv = MKMapView(frame: self.view.frame)
        
        // Specify the center position of MapView.
        mv.centerCoordinate = CLLocationCoordinate2DMake(kDefault_latitude, kDefault_longitude)
        
        // Change the scale.
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        
        // Specify the center position specified in MapView and the span declared with MKCoordinateSapn.
        let region: MKCoordinateRegion = MKCoordinateRegion(center: mv.centerCoordinate, span: span)
        
        // Specify region as the region property of MapView.
        mv.region = region
        
        return mv
    }()
    
    lazy var _seqCon: UISegmentedControl = {
        let sc: UISegmentedControl = UISegmentedControl(items: mapTypes)
        sc.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height-100)
        sc.backgroundColor = UIColor.gray
        sc.tintColor = UIColor.white
        
        // Add an event.
        sc.addTarget(self, action: #selector(segconChanged(_:)), for: .valueChanged)
        sc.selectedSegmentIndex = 0
        return sc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Add mapView on view
        self.view.addSubview(_mapView)
        
        // Add segmentedControl on view
        self.view.addSubview(_seqCon)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc private func segconChanged(_ segcon: UISegmentedControl) {
        switch(segcon.selectedSegmentIndex) {
        // Set map type to standard.
        case 0: _mapView.mapType = MKMapType.standard
        // Set the map type to hybrid (aerial photograph + standard).
        case 1: _mapView.mapType = MKMapType.hybrid
        // Set the map type as aerial photograph.
        case 2: _mapView.mapType = MKMapType.satellite
        default: print("Error")
        }
        
    }

}
