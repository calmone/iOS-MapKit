//
//  BaseViewController.swift
//  MapKit handling
//
//  Created by Taehyeon Han on 2018. 9. 12..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit
import MapKit

class BaseViewController: UIViewController {
    
    let kDefault_latitude: CLLocationDegrees = 37.484557
    let kDefault_longitude: CLLocationDegrees = 126.896367
    
    var kDefault_height: CGFloat! = 50.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    init(componentName: String) {
        super.init(nibName: nil, bundle: nil)
        self.navigationItem.title = componentName
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func appDelegate() -> AppDelegate? {
        guard let app = UIApplication.shared.delegate as? AppDelegate else { return nil }
        return app
    }
    
    private func setupView() {
        self.view.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
    }
    
}
