//
//  HomeView.swift
//  M6
//
//  Created by idan Cohen on 02/05/2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model : ContentModel
    
    var body: some View {
        
        if model.resturants.count != 0 || model.sights.count != 0{
            
            if !model.isMap {
                ListView()
            }
            else{
                MapView()
            }
            
        }
         else {
            ProgressView()
        }
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
