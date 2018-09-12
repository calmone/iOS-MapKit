//
//  _09.swift
//  MapKit handling
//
//  Created by Taehyeon Han on 2018. 9. 12..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit
import MapKit

class _09: BaseViewController {
    
    var center: CLLocationCoordinate2D!
    var requestCoordinate: CLLocationCoordinate2D!
    var fromCoordinate: CLLocationCoordinate2D!
    // Generate MKMapView
    lazy var _mapView: MKMapView = {
        let mv = MKMapView(frame: self.view.frame)
        
        mv.delegate = self
        
        // Set the latitude and longitude of the starting point.
        let myLatitude: CLLocationDegrees = kDefault_latitude
        let myLongitude: CLLocationDegrees = kDefault_longitude
        
        // Set the latitude and longitude of the destination.
        let requestLatitude: CLLocationDegrees = kDefault_latitude+0.05
        let requestLongitude: CLLocationDegrees = kDefault_longitude-0.03
        
        // Specify the coordinates of the destination.
        requestCoordinate = CLLocationCoordinate2DMake(requestLatitude, requestLongitude)
        fromCoordinate = CLLocationCoordinate2DMake(myLatitude, myLongitude)
        
        // Set the center of the map between the starting point and the destination.
        let center: CLLocationCoordinate2D = CLLocationCoordinate2DMake((myLatitude + requestLatitude)/2, (myLongitude + requestLongitude)/2)
        
        // Set the center on mapView.
        mv.setCenter(center, animated: true)
        
        // Specify the scale.
        let mySpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let myRegion: MKCoordinateRegion = MKCoordinateRegion(center: center, span: mySpan)
        
        // Set region to mapView.
        mv.region = myRegion
        
        return mv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Add mapView on view
        self.view.addSubview(_mapView)
        
        makeAnnotations()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func makeAnnotations() {
        // Create PlaceMark and set the coordinates of starting point and destination.
        let fromPlace: MKPlacemark = MKPlacemark(coordinate: fromCoordinate, addressDictionary: nil)
        let toPlace: MKPlacemark = MKPlacemark(coordinate: requestCoordinate, addressDictionary: nil)
        
        // Create Item and set PlaceMark.
        let fromItem: MKMapItem = MKMapItem(placemark: fromPlace)
        let toItem: MKMapItem = MKMapItem(placemark: toPlace)
        
        // Generate MKDirectionsRequest.
        let myRequest: MKDirectionsRequest = MKDirectionsRequest()
        
        // Set item of departure place.
        myRequest.source = fromItem
        
        // Set Item of the destination.
        myRequest.destination = toItem
        
        // Searching for multiple routes is effective.
        myRequest.requestsAlternateRoutes = true
        
        // Set the moving means to the car.
        myRequest.transportType = MKDirectionsTransportType.automobile
        
        // Create MKDirections and set Request.
        let myDirections: MKDirections = MKDirections(request: myRequest)
        
        // Route search.
        myDirections.calculate { (response, error) in
            // I received an NSError or there is no route.
            if error != nil || response!.routes.isEmpty { return }
            
            let route: MKRoute = response!.routes[0] as MKRoute
            print("To the destination \(route.distance)m")
            print("Time required \(Int(route.expectedTravelTime/60))Minute")
            
            // Draw the route in mapView.
            self._mapView.add(route.polyline)
        }
        
        // Generate pins.
        let fromPin: MKPointAnnotation = MKPointAnnotation()
        let toPin: MKPointAnnotation = MKPointAnnotation()
        
        // Set the coordinates.
        fromPin.coordinate = fromCoordinate
        toPin.coordinate = requestCoordinate
        
        // Set the title.
        fromPin.title = "Departure point"
        toPin.title = "destination"
        
        // Added to mapView.
        _mapView.addAnnotation(fromPin)
        _mapView.addAnnotation(toPin)
    }

}

extension _09: MKMapViewDelegate {
    
    // Route display setting.
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let route: MKPolyline = overlay as! MKPolyline
        let routeRenderer: MKPolylineRenderer = MKPolylineRenderer(polyline: route)
        
        // The line thickness of the route.
        routeRenderer.lineWidth = 3.0
        
        // Color of the route's line.
        routeRenderer.strokeColor = UIColor.red
        
        return routeRenderer
    }
    
}
