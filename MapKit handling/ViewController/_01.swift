//
//  _01.swift
//  MapKit handling
//
//  Created by Taehyeon Han on 2018. 9. 12..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit
import MapKit

class _01: BaseViewController {
    
    // Generate MKMapView
    lazy var _mapView: MKMapView = {
        let mv = MKMapView()
        mv.frame = self.view.bounds
        mv.delegate = self
        
        return mv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add MKMapView on view
        self.view.addSubview(_mapView)
        
        // latitude and longitude of the center point.
        let myLat: CLLocationDegrees = 37.484557
        let myLon: CLLocationDegrees = 126.896367
        let myCoordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(myLat, myLon)
        
        // Scale.
        let myLatDist : CLLocationDistance = 100
        let myLonDist : CLLocationDistance = 100
        
        // Create Region.
        let myRegion: MKCoordinateRegion = MKCoordinateRegionMakeWithDistance(myCoordinate, myLatDist, myLonDist)
        
        // Reflected in MapView.
        _mapView.setRegion(myRegion, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension _01: MKMapViewDelegate {
    
    // Method called when the Region is changed.
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print("regionDidChangeAnimated")
    }
    
}
