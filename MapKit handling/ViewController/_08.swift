//
//  _08.swift
//  MapKit handling
//
//  Created by Taehyeon Han on 2018. 9. 12..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit
import MapKit

class _08: BaseViewController {

    var center: CLLocationCoordinate2D!
    
    // Generate MKMapView
    lazy var _mapView: MKMapView = {
        let mv = MKMapView(frame: self.view.frame)
        
        mv.centerCoordinate = center
        mv.delegate = self
        
        // 縮尺を指定.
        let mySpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let myRegion: MKCoordinateRegion = MKCoordinateRegion(center: center, span: mySpan)
        
        // Added region to MapView.
        mv.region = myRegion
        
        // Generate PointAnnotation.
        let myPointAnnotation: MKPointAnnotation = MKPointAnnotation()
        myPointAnnotation.coordinate = center
        mv.addAnnotation(myPointAnnotation)
        
        return mv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        center = CLLocationCoordinate2DMake(kDefault_latitude, kDefault_longitude)
        
        // Do any additional setup after loading the view.
        
        // Add mapKit on View
        self.view.addSubview(_mapView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension _08: MKMapViewDelegate {
    
    // It is executed after addAnnotation.
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let myIdentifier = "myPin"
        
        var myAnnotation: MKAnnotationView!
        
        // If annotation is not found, we will create a new annotation.
        if myAnnotation == nil {
            myAnnotation = MKAnnotationView(annotation: annotation, reuseIdentifier: myIdentifier)
        }
        
        // Select image.
        myAnnotation.image = UIImage(named: "logo.jpeg")!
        myAnnotation.annotation = annotation
        
        return myAnnotation
    }
    
}
