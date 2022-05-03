//
//  ContentModel.swift
//  M6
//
//  Created by idan Cohen on 01/05/2022.
//

import Foundation
import CoreLocation

class ContentModel :  NSObject, CLLocationManagerDelegate, ObservableObject{
    
    @Published var locationManager = CLLocationManager()
    @Published var resturants = [Business]()
    @Published var sights = [Business]()
    @Published var authorizationState = CLAuthorizationStatus.notDetermined
    @Published var isMap = false
    
    override init(){
        super.init()
        
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
    }
 
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        authorizationState = locationManager.authorizationStatus
        
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
            getBusinesses(category: "arts", location: userLocation!)
            getBusinesses(category: "restaurants", location: userLocation!)
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
                    do{
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(BusinessSearch.self, from: data!)
                        // Sort businesses
                        var businesses = result.businesses
                        businesses.sort { (b1, b2) -> Bool in
                            return b1.distance ?? 0 < b2.distance ?? 0
                        }
                        
                        // Call the get image function of the businesses
                        for b in businesses {
                            b.getImageData()
                        }
                        DispatchQueue.main.async {
                            if category == "arts" {
                                self.sights = result.businesses
                            }
                            else if category == "restaurants"{
                                self.resturants = result.businesses
                            }
                        }
                        
                        
                        
                    }
                    catch{
                        print(error)
                    }
                    
                    
                    
                }
                
                
                
            }
            dataTask.resume()
            
            
            
            
            
        }
        
        
    }
}
