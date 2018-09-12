//
//  _10.swift
//  MapKit handling
//
//  Created by Taehyeon Han on 2018. 9. 12..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit
import MapKit

class _10: BaseViewController {
    
    var myRegion: MKCoordinateRegion!
    
    lazy var _mapView: MKMapView = {
        let mv = MKMapView(frame: self.view.frame)
        
        mv.delegate = self
        
        // Set the center point.
        let center: CLLocationCoordinate2D = CLLocationCoordinate2DMake(kDefault_latitude, kDefault_longitude)
        
        // Set the center point in MapView.
        mv.setCenter(center, animated: true)
        
        // Specify the scale (display area).
        let mySpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        myRegion = MKCoordinateRegionMake(center, mySpan)
        
        // Added region to MapView.
        mv.region = myRegion
        
        return mv
    }()
    
    lazy var _searchBar: UISearchBar = {
        let sb = UISearchBar(frame: CGRect(x: self.view.frame.width/2 - 300/2, y: kDefault_height+80, width: 300, height: 120))
        sb.delegate = self
        sb.layer.shadowColor = UIColor.lightGray.cgColor
        sb.layer.shadowOpacity = 0.5
        sb.layer.masksToBounds = false
        sb.showsCancelButton = true
        sb.showsBookmarkButton = false
        sb.prompt = "Local search"
        sb.placeholder = "Please enter here"
        sb.tintColor = UIColor.red
        sb.showsSearchResultsButton = false
        
        return sb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Add mapView on view
        self.view.addSubview(_mapView)
        
        // Add searchBar on view
        self.view.addSubview(_searchBar)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension _10: MKMapViewDelegate, UISearchBarDelegate {
    
    // Called when the Search button is pressed.
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // Editing done.
        self.view.endEditing(true)
        
        // Create request.
        let myRequest: MKLocalSearchRequest = MKLocalSearchRequest()
        
        // Specify the range.
        myRequest.region = myRegion
        
        // Specify the word to be searched in the text of searchBar.
        myRequest.naturalLanguageQuery = searchBar.text
        
        // Generate LocalSearch.
        let mySearch: MKLocalSearch = MKLocalSearch(request: myRequest)
        
        // Start searching.
        mySearch.start { (response, error) -> Void in
            if error != nil {
                print("Name of the place")
            } else if response!.mapItems.count > 0 {
                for item in response!.mapItems {
                    // Output inside name of search result.
                    if let name = item.name {
                        print(name)
                    }
                }
            }
        }
    }
    
    // Called when the Cancel button is pressed.
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
    }
    
}
