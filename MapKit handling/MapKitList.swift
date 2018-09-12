//
//  MapKitList.swift
//  MapKit handling
//
//  Created by Taehyeon Han on 2018. 9. 11..
//  Copyright © 2018년 calmone. All rights reserved.
//

import Foundation

enum MapKitList: Int {
    case _01 = 0
    
    /* Don't use */
    case COUNT
    
    func getInfo() -> ListInfo {
        switch self {
        case ._01: return ListInfo(name: "Display Map")
            
            /* Don't use */
        case .COUNT: return ListInfo(name: "Count")
        }
    }
    
}

struct ListInfo {
    var name: String
}
