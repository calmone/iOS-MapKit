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
            case ._02: vc = _02(componentName: componentName)
            case ._03: vc = _03(componentName: componentName)
            case ._04: vc = _04(componentName: componentName)
            case ._05: vc = _05(componentName: componentName)
            case ._06: vc = _06(componentName: componentName)
            case ._07: vc = _07(componentName: componentName)
            case ._08: vc = _08(componentName: componentName)
            case ._09: vc = _09(componentName: componentName)
            case ._10: vc = _10(componentName: componentName)
            case ._11: vc = _11(componentName: componentName)
            case ._12: vc = _12(componentName: componentName)
            case ._13: vc = _13(componentName: componentName)
            case ._14: vc = _14(componentName: componentName)
            case ._15: vc = _15(componentName: componentName)
            case ._16: vc = _16(componentName: componentName)
                
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
