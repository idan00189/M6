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
            VStack{
                
                HStack{
                    Image(systemName: "location.circle.fill")
                    Text("San Fransisco")
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Switch to Map View")
                    }

                }.padding(.horizontal)
                Divider()
                
                ScrollView{
                    
                    LazyVStack(pinnedViews:[.sectionHeaders]){
                        
                        Section {
                            ForEach(model.resturants){ r in
                                Text(r.name ?? "")
                                Divider()
                            }
                        } header: {
                            ZStack(alignment: .leading){
                                Rectangle()
                                    .foregroundColor(.white)
                                    
                                Text("Resturants")
                                    .bold()
                            }
                            
                            
                        }
                        Section {
                            ForEach(model.sights){ s in
                                Text(s.name ?? "")
                                Divider()
                            }
                        } header: {
                            ZStack(alignment: .leading){
                                Rectangle()
                                    .foregroundColor(.white)
                                Text("Sights")
                                    .bold()
                            }
                        }
                        
                    }
                    
                    
                    
                }
                
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
    }
}
