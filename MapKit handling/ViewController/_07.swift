//
//  _07.swift
//  MapKit handling
//
//  Created by Taehyeon Han on 2018. 9. 12..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit
import MapKit

class _07: BaseViewController {

    var center: CLLocationCoordinate2D!

    // Generate MKMapView
    lazy var _mapView: MKMapView = {
        let mv = MKMapView(frame: self.view.frame)
        
        mv.centerCoordinate = center
        mv.delegate = self
        
        // Specify the scale.
        let mySpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let myRegion: MKCoordinateRegion = MKCoordinateRegion(center: center, span: mySpan)
        
        // Added region to mapView.
        mv.region = myRegion
        
        // viewにmapViewを追加.
        self.view.addSubview(mv)
        
        // Draw a circle (radius 500 m).
        // let myCircle: MKCircle = MKCircle(centerCoordinate: center, radius: CLLocationDistance(500))
        let myCircle: MKCircle = MKCircle(center: center, radius: CLLocationDistance(500))
        
        // Add circle to mapView.
        mv.add(myCircle)
        
        // Generate an annotation pointing to center.
        let myPointAnnotation: MKPointAnnotation = MKPointAnnotation()
        myPointAnnotation.title = "title"
        myPointAnnotation.subtitle = "subtitle"
        myPointAnnotation.coordinate = center
        
        // Added annotation to mapView.
        mv.addAnnotation(myPointAnnotation)
        
        return mv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        center = CLLocationCoordinate2DMake(kDefault_latitude, kDefault_longitude)
        
        // Do any additional setup after loading the view.
        
        // Add mapView on view
        self.view.addSubview(_mapView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension _07: MKMapViewDelegate {
    
    // Delegate method called when addAnnotation is done.
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        // Identifier is generated.
        let myAnnotationIdentifier: String = "myAnnotation"
        
        // Annotation generation.
        var myAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: myAnnotationIdentifier)
        
        if myAnnotationView == nil {
            
            myAnnotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: myAnnotationIdentifier)
            
            // Allow annotation callouts.
            myAnnotationView!.canShowCallout = true
            
            // Add an image to the annotation.
            myAnnotationView!.leftCalloutAccessoryView = UIImageView(image: UIImage(named: "logo.jpeg"))
        }
        
        return myAnnotationView
    }
    
    // Delegate method called when addOverlay is done.
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        // // Generate renderer.
        let myCircleView: MKCircleRenderer = MKCircleRenderer(overlay: overlay)
        
        // Fill the interior of the circle with blue.
        myCircleView.fillColor = UIColor.blue
        
        // Transmit the circle.
        myCircleView.alpha = 0.5
        
        // Thickness of the circumference line.
        myCircleView.lineWidth = 0.5
        
        return myCircleView
    }
    
}
