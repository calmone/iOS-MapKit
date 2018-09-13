//
//  _12.swift
//  MapKit handling
//
//  Created by Taehyeon Han on 2018. 9. 12..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit
import MapKit

class _12: BaseViewController {
    
    var center: CLLocationCoordinate2D!
    
    lazy var _mapView: MKMapView = {
        let mv = MKMapView(frame: self.view.frame)
        
        center = CLLocationCoordinate2DMake(kDefault_latitude, kDefault_longitude)
        
        mv.centerCoordinate = center
        mv.delegate = self
        
        // Set the scale.
        let mySpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let myRegion: MKCoordinateRegion = MKCoordinateRegion(center: center, span: mySpan)
        
        // Added region to mapView.
        mv.region = myRegion
        
        // Draw a circle (radius 1000 m).
        let myCircle: MKCircle = MKCircle(center: center, radius: CLLocationDistance(1000))
        
        // Add circle to mapView.
        mv.add(myCircle)
        
        return mv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Add mapView to view.
        self.view.addSubview(_mapView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension _12: MKMapViewDelegate {
    
    // Delegate method called when addOverlay is done.
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        // Generate renderer.
        let myCircleView: MKCircleRenderer = MKCircleRenderer(overlay: overlay)
        
        // Fill the inside of the circle with red.
        myCircleView.fillColor = UIColor.red
        
        // Set the color of the circumferential line to black.
        myCircleView.strokeColor = UIColor.black
        
        // Transmit the circle.
        myCircleView.alpha = 0.5
        
        // Thickness of the circumference line.
        myCircleView.lineWidth = 1.5
        
        return myCircleView
    }
    
}
