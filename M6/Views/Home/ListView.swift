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

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(ContentModel())
    }
}
