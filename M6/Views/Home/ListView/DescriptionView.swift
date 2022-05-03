//
//  DescriptionView.swift
//  M6
//
//  Created by idan Cohen on 03/05/2022.
//

import SwiftUI

struct DescriptionView: View {
    var business : Business
    var body: some View {
        
        VStack{
            VStack(spacing: 0){
                // image
                GeometryReader() { geo in
                    let uiimage = UIImage(data: business.imageData ?? Data())
                    Image(uiImage: uiimage ?? UIImage())
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        
                        .frame(width: geo.size.width, height: geo.size.height)
                }.ignoresSafeArea(.all, edges: .top)
                // open or close
                ZStack(alignment: .leading){
                Rectangle()
                    .foregroundColor(business.isClosed! ? .black : .blue)
                    .frame( height: 38)
                    Text(business.isClosed! ? "Close" : "Open")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.horizontal)
                }
                
                
            }
            Group{
                VStack(alignment: .leading){
                    
                
            // business name
                    Text(business.name ?? "").font(.title2)
                .bold()
                .padding()
            // business adress
            ForEach(business.location?.displayAddress ?? [String]() , id: \.self) { d in
                Text(d)
            }.padding(.horizontal)
            
            // business rating
            Image("regular_\(business.rating!)")
                        .padding()
            Divider()
            
            // business phone
                    HStack {
                        Text("Phone: ")
                            .bold()
                        Text(String(business.displayPhone ?? ""))
                        Spacer()
                        Link(destination: URL(string: "tel:\(business.phone!)")!) {
                            Text("Call")
                        }
                    }.padding()
            Divider()
            
            // business reviews count
                    HStack {
                        Text("Reviws: ")
                            .bold()
                        Text(String(business.reviewCount ?? 0))
                        Spacer()
                        Link(destination: URL(string:business.url!)!) {
                            Text("Read")
                        }
                    }.padding()
            Divider()
            
            //business websiite
                    HStack {
                        Text("Website: ")
                            .bold()
                        Text(String(business.url ?? ""))
                            .lineLimit(1)
                        Spacer()
                        Link(destination: URL(string:business.url!)!) {
                            Text("Visit")
                        }
                    }.padding()
                }
                
            }
            Button {
                
            } label: {
                ZStack{
                    Rectangle()
                        .foregroundColor(.blue)
                        .frame( height: 48)
                        .cornerRadius(10)
                    Text("Get Direction")
                        .foregroundColor(.white)
                    
                }.padding()
                
            }
            

        }
        
        
        
    }
}



