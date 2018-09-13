//
//  _13.swift
//  MapKit handling
//
//  Created by Taehyeon Han on 2018. 9. 12..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit
import MapKit

class _13: BaseViewController {
    
    var center: CLLocationCoordinate2D!
    
    lazy var _mapView: MKMapView = {
        let mv = MKMapView(frame: self.view.frame)
        
        center = CLLocationCoordinate2DMake(kDefault_latitude, kDefault_longitude)
        
        mv.centerCoordinate = center
        mv.delegate = self
        
        // Specify the scale.
        let mySpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let myRegion: MKCoordinateRegion = MKCoordinateRegion(center: center, span: mySpan)
        
        // Added region to mapView.
        mv.region = myRegion
        
        // Create coordinates to draw straight lines.
        let coordinate_1 = CLLocationCoordinate2D(latitude: kDefault_latitude, longitude: kDefault_longitude)
        let coordinate_2 = CLLocationCoordinate2D(latitude: kDefault_latitude+0.05, longitude: kDefault_longitude-0.03)
        let coordinate_3 = CLLocationCoordinate2D(latitude: kDefault_latitude, longitude: kDefault_longitude-0.03)
        let coordinate_4 = CLLocationCoordinate2D(latitude: kDefault_latitude+0.05, longitude: kDefault_longitude)
        
        // Store the coordinates in an array.
        var coordinates_1 = [coordinate_1, coordinate_2]
        var coordinates_2 = [coordinate_3, coordinate_4]
        
        // Create polyline.
        let myPolyLine_1: MKPolyline = MKPolyline(coordinates: &coordinates_1, count: coordinates_1.count)
        let myPolyLine_2: MKPolyline = MKPolyline(coordinates: &coordinates_2, count: coordinates_2.count)
        
        // Add circle to mapView.
        mv.add(myPolyLine_1)
        mv.add(myPolyLine_2)
        
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

extension _13: MKMapViewDelegate {
    
    // Delegate method called when addOverlay is done.
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        // Generate renderer.
        let myPolyLineRendere: MKPolylineRenderer = MKPolylineRenderer(overlay: overlay)
        
        // Specify the thickness of the line.
        myPolyLineRendere.lineWidth = 3
        
        // Specify the color of the line.
        myPolyLineRendere.strokeColor = UIColor.red
        
        return myPolyLineRendere
    }
    
}
