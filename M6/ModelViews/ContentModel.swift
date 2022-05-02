//
//  ContentModel.swift
//  M6
//
//  Created by idan Cohen on 01/05/2022.
//

import Foundation
import CoreLocation

class ContentModel :  NSObject, CLLocationManagerDelegate, ObservableObject{
    
    var locationManager = CLLocationManager()
    
    override init(){
        super.init()
        
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
    }
 
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        if locationManager.authorizationStatus == .authorizedWhenInUse || locationManager.authorizationStatus == .authorizedAlways {
            
            locationManager.startUpdatingLocation()
            
        }
        else if locationManager.authorizationStatus == .denied {
            
            
        }
            
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation = locations.first
        
        if userLocation != nil{
            locationManager.stopUpdatingLocation()
            getBusinesses(category: "Restaurants", location: userLocation!)
        }
    }
    
    
    func getBusinesses(category : String , location: CLLocation){
        
        let urlString = "https://api.yelp.com/v3/businesses/search?latitude=\(location.coordinate.latitude)&longitude=\(location.coordinate.longitude)&categories=\(category)&limit=6"
        
        let url = URL(string: urlString)
        
        if let url = url {
            
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
            
            request.httpMethod = "GET"
            request.addValue("Bearer 3rn9ola9nsHTHD_-LsngdhQKz9u0tSQ_kdI5RJ_kMHPFtnpqNPwo4h10zrUo4aJz6TjMeuVisGHsSFKDjoF649SbhkvoWdTFrSCoyZlvCyR6hM6SRjYb_Vwc9i1rYnYx", forHTTPHeaderField: "Authorization")
            
            let seasson = URLSession.shared
            
            let dataTask = seasson.dataTask(with: request) { data, response, error in
                
                if error == nil {
                    print(response)
                }
                
                
                
            }
            dataTask.resume()
            
            
            
            
            
        }
        
        
    }
}
