//
//  _14.swift
//  MapKit handling
//
//  Created by Taehyeon Han on 2018. 9. 12..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit
import MapKit

class _14: BaseViewController {
    
    var _snapShotOptions: MKMapSnapshotOptions = MKMapSnapshotOptions()
    var _snapShot: MKMapSnapshotter!
    var center: CLLocationCoordinate2D!
    
    var mySpan: MKCoordinateSpan!
    var myRegion: MKCoordinateRegion!
    
    // Generate mapView
    lazy var _mapView: MKMapView = {
        let mv = MKMapView(frame: self.view.frame)
        
        center = CLLocationCoordinate2DMake(kDefault_latitude, kDefault_longitude)
        
        mv.centerCoordinate = center
        
        // Set the center point in MapView.
        mv.setCenter(center, animated: true)
        
        // Specify the scale (display area).
        mySpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        myRegion = MKCoordinateRegionMake(center, mySpan)
        
        // Added region to MapView.
        mv.region = myRegion
        
        return mv
    }()
    
    // Generate button
    lazy var _button: UIButton = {
        let b = UIButton(frame: CGRect(x: 0, y: kDefault_height, width: 200, height: 50))
        b.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height-100)
        b.layer.cornerRadius = 20.0
        b.backgroundColor = UIColor.red
        b.setTitle("Snap Shot", for: .normal)
        b.setTitleColor(UIColor.white, for: .normal)
        b.addTarget(self, action: #selector(onClickButton(_:)), for: .touchUpInside)
        
        return b
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add mapView on view
        self.view.addSubview(_mapView)
        
        // Add button on view
        self.view.addSubview(_button)
        
        // MKMapSnapShotOptions setting.
        _snapShotOptions.region = myRegion
        _snapShotOptions.size = _mapView.frame.size
        _snapShotOptions.scale = UIScreen.main.scale
        
        // Set MKMapSnapShotOptions to MKMapSnapShotter.
        _snapShot = MKMapSnapshotter(options: _snapShotOptions)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc private func onClickButton(_ sender: UIButton) {
        // Cancel if there is a running snapshot.
        _snapShot.cancel()
        
        // Generate UIImageView.
        let myImageView: UIImageView = UIImageView(frame: CGRect(x: self.view.center.x - 250/2, y: self.view.center.y - 180/2, width: 250, height: 180))
        
        // Maintain the aspect ratio of the image.
        myImageView.contentMode = UIViewContentMode.scaleAspectFit
        
        // Set backgroundColor
        myImageView.backgroundColor = .white
        
        // Set borderLine
        myImageView.layer.masksToBounds = true
        myImageView.layer.borderWidth = 1.0
        myImageView.layer.borderColor = UIColor.red.cgColor
        
        // Take a snapshot.
        _snapShot.start { (snapshot, error) -> Void in
            if error == nil {
                myImageView.image = snapshot!.image
            } else {
                print("error")
            }
        }
        
        // Add UIImageView to view.
        self.view.addSubview(myImageView)
    }
    
}
