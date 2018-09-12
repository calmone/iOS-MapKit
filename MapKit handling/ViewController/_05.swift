//
//  _05.swift
//  MapKit handling
//
//  Created by Taehyeon Han on 2018. 9. 12..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit
import MapKit

class _05: BaseViewController {
    
    lazy var _mapView: MKMapView = {
        let mv = MKMapView(frame: self.view.frame)
        
        // Set longitude, latitude, center point.
        let myCenter: CLLocationCoordinate2D = CLLocationCoordinate2DMake(kDefault_latitude, kDefault_longitude)
        
        // Set the center in MapView.
        mv.setCenter(myCenter, animated: true)
        
        // Scale.
        let mySapn: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let myRegion: MKCoordinateRegion = MKCoordinateRegion(center: myCenter, span: mySapn)
        
        // Set region to MapView.
        mv.region = myRegion
        
        // Coordinates of my point of view.
        let fromCoordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(kDefault_latitude-0.21, kDefault_longitude+0.01)
        
        // Height overlooking from the sky.
        let myAltitude: CLLocationDistance = 150.0
        
        // Set center point, view point, height in MapCamera.
        let myCamera: MKMapCamera = MKMapCamera(lookingAtCenter: myCenter, fromEyeCoordinate: fromCoordinate, eyeAltitude: myAltitude)
        
        // Set Camera to MapView.
        mv.setCamera(myCamera, animated: true)
        
        // Make the building look like 3D.
        mv.showsBuildings = true
        
        return mv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Add mapView on view
        self.view.addSubview(_mapView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
