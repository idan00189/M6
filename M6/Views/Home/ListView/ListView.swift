//
//  ListView.swift
//  M6
//
//  Created by idan Cohen on 02/05/2022.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var model : ContentModel
    var body: some View {
        NavigationView{
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
                
                
                
            
            ScrollView(showsIndicators: false){
            
            LazyVStack(pinnedViews:[.sectionHeaders]){
                
                Section {
                    ForEach(model.resturants){ r in
                        NavigationLink {
                            DescriptionView(business: r)
                        } label: {
                            SingleView(business: r)
                        }

                        
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
                        NavigationLink {
                            DescriptionView(business: s)
                        } label: {
                            SingleView(business: s)
                        }

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
                
            }.navigationBarHidden(true)
            
            
            
        }.foregroundColor(.black)
                
            
            }
            
        }
    }
}

