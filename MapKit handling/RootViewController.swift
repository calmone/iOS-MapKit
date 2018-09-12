//
//  RootViewController.swift
//  MapKit handling
//
//  Created by Taehyeon Han on 2018. 9. 12..
//  Copyright © 2018년 calmone. All rights reserved.
//

import Foundation
import UIKit

class RootViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.size.height / 11.5
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MapKitList.COUNT.hashValue
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let component = MapKitList.init(rawValue: indexPath.row) {
            var vc: UIViewController!
            let componentName = component.getInfo().name
            
            switch component {
            case ._01: vc = _01(componentName: componentName)
                
                /* Don't use */
            case .COUNT: return
            }
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MapKitCell", for: indexPath)
        
        if let component = MapKitList.init(rawValue: indexPath.row) {
            let componentName: String = component.getInfo().name
            cell.textLabel?.text = componentName
        }
        
        return cell
    }
    
}
