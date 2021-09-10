//
//  SideBarView.swift
//  SideMenuRotation
//
//  Created by iMac on 10/09/21.
//

import SwiftUI

struct SideBarView: View {
    
    var leading: CGFloat = 0
    var buttonAction: () -> () = {}
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top), content: {
            VStack(alignment: .leading, content: {
                HStack {
                    Image("messi")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .padding(10)
                        .overlay(Circle().stroke(Color.black, lineWidth: 1))
                    
                    Button(action: {
                        buttonAction()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .medium))
                            .aspectRatio(contentMode: .fit)
                            .padding(14)
                            .overlay(Circle().stroke(lineWidth: 0.85).foregroundColor(.black))
                        
                    })
                    .padding(.leading, 54)
                }
                
                VStack(alignment: .leading, content: {
                    Text("Lionel Messi")
                        .font(.title)
                        .fontWeight(.heavy)
                        .shadow(radius: 2)
                    
                    Text("Professional Footballer")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .opacity(0.7)
                        .padding(.top, 10)
                        .shadow(radius: 2)
                    
                    
                    VStack(alignment: .leading, spacing: 15, content: {
                        
                        SideBarActions(buttonImage: "flag.fill", title: "Priority")
                        SideBarActions(buttonImage: "square.grid.2x2", title: "Categories")
                        SideBarActions(buttonImage: "calendar", title: "Archived")
                        SideBarActions(buttonImage: "gearshape", title: "Settings")
                        
                    }).padding(.top, 40)
                    
                    Spacer(minLength: 0)
                    
                    
                })
                .padding(.top, 40)
                .foregroundColor(.black)
                
            }).padding(20)
            .padding(.top, 32)
            .padding(.leading, leading)
            
        })
    }
}

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarView()
    }
}

struct SideBarActions: View {
    
    var buttonImage: String = ""
    var title: String = ""
    var buttonAction: () -> () = {}
    
    var body: some View {
        HStack{
            Button(action: {
                buttonAction()
            }, label: {
                Image(systemName: buttonImage)
                    .foregroundColor(.black)
                    .font(.system(size: 20, weight: .medium))
                    .frame(width: 38, height: 38)
                    .opacity(0.6)
            })
            
            Text(title)
                .font(.headline)
                .fontWeight(.medium)
                .padding(.leading, 16)
                .opacity(0.7)
                .shadow(radius: 2)
            
        }
    }
}
