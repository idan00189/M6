//
//  SingleView.swift
//  M6
//
//  Created by idan Cohen on 03/05/2022.
//

import SwiftUI

struct SingleView: View {
    @ObservedObject var business : Business
    
    var body: some View {
        HStack{
            //image
            let uiImage = UIImage(data: business.imageData ?? Data())
            Image(uiImage: uiImage ?? UIImage())
                .resizable()
                .scaledToFit()
                .frame(width: 58, height: 58, alignment: .center)
            
            VStack(alignment:.leading, spacing: 10){
                Text(business.name ?? "")
                    .bold()
                Text(String(format:"%.1f km away", (business.distance ?? 0)/1000 ))
                    .font(.caption)
            }
            Spacer()
            VStack(alignment:.leading, spacing: 10){
                Image("regular_\(business.rating ?? 0)")
                Text(String(business.reviewCount ?? 0))
                    .font(.caption)
            }
            
            
        }.padding()
    }
}


