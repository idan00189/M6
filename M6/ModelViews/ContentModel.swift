//
//  ContentModel.swift
//  M6
//
//  Created by idan Cohen on 01/05/2022.
//

import Foundation
import CoreLocation
import CoreData

class ContentModel : NSObject , CLLocationManagerDelegate, ObservableObject{
    
    var locationManager = CLLocationManager()
    
    override init(){
        super.init()
        locationManager.requestWhenInUseAuthorization()
    }
    
    
}
