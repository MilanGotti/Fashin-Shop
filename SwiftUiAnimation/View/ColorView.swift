//
//  ColorView.swift
//  SwiftUiAnimation
//
//  Created by iMac on 09/09/21.
//

import SwiftUI

struct ColorView: View {
    
    var color: Color
    @Binding var selectedColor: Color
    
    var body: some View {
        ZStack{
            Circle()
                .fill(color)
                .frame(width: 20, height: 20)
            
            Circle()
                .stroke(color.opacity(selectedColor == color ? 1 : 0))
                .frame(width: 30, height: 30)
        }
        .onTapGesture {
            withAnimation{selectedColor = color}
        }
    }
}

 
