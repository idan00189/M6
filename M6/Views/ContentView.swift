//
//  ContentView.swift
//  M6
//
//  Created by idan Cohen on 01/05/2022.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    @EnvironmentObject var model : ContentModel
    
    var body: some View {
        if model.authorizationState ==  .authorizedAlways ||
            model.authorizationState == .authorizedWhenInUse {
            //show HomeView
            HomeView()
            
        }
        else if model.authorizationState == .notDetermined {
            // show onboarding view
        }
        else if model.authorizationState == .denied {
            //show denied view
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
