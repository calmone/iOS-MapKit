//
//  _02.swift
//  MapKit handling
//
//  Created by Taehyeon Han on 2018. 9. 12..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit
import MapKit

class _02: BaseViewController {
    
    // Generate MKMapView
    lazy var _mapView: MKMapView = {
        let mv = MKMapView(frame: self.view.frame)
        
        mv.centerCoordinate = CLLocationCoordinate2DMake(kDefault_latitude, kDefault_longitude)
        
        // Change the scale.
        // Specify magnification.
        let span : MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        
        // Specify the center position specified in MapView and the span declared with MKCoordinateSapn.
        let region : MKCoordinateRegion = MKCoordinateRegion(center: mv.centerCoordinate, span: span)
        
        return mv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Add MKMapView on view
        self.view.addSubview(_mapView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
