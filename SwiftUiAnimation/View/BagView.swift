//
//  BagView.swift
//  SwiftUiAnimation
//
//  Created by iMac on 09/09/21.
//

import SwiftUI

struct BagView: View {
    
    var bagData: BagModel
    var animation: Namespace.ID
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6, content: {
            ZStack{
                Color(bagData.image)
                    .cornerRadius(20)
                Image(bagData.image)
                    .resizable()
                    .frame(height: 150)
                    .aspectRatio(contentMode: .fit)
                    .padding(20)
                    .matchedGeometryEffect(id: bagData.image, in: animation)
            }
            
            Text(bagData.title)
                .fontWeight(.heavy)
                .foregroundColor(.gray)
            Text(bagData.price)
                .fontWeight(.heavy)
                .foregroundColor(.black)
            
        })
    }
}

