//
//  DetailView.swift
//  SwiftUiAnimation
//
//  Created by iMac on 09/09/21.
//

import SwiftUI

struct DetailView: View {
    
    @Binding var bagData: BagModel!
    @Binding var show: Bool
    @State var selectedColor = Color.red
    @State var count = 0
    @State var isSmallDevice = UIScreen.main.bounds.height < 750
    
    var animation: Namespace.ID
    
    var body: some View {
        VStack {
            HStack{
                Button(action: {
                    withAnimation(.easeOut) { show.toggle() }
                }, label: {
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(.white)
                })
                 
                Spacer(minLength: 0)
                
                Button(action: {
                    withAnimation(.easeOut) { show.toggle() }
                }, label: {
                    Image(systemName: "cart")
                        .font(.title)
                        .foregroundColor(.white)
                })
            }
            .padding(.horizontal)
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            HStack{
            VStack(alignment: .leading, spacing: 6, content: {
                Text("Aristocratic Hand Bag")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top)
                
                Text(bagData.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
            })
            .padding(.horizontal)
                Spacer(minLength: 0)
            }
            
            HStack(spacing: 10) {
                VStack(alignment: .leading, spacing: 6 , content: {
                    Text("Price")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text(bagData.price)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                })
                
                Image(bagData.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: bagData.image, in: animation)
            }
            .padding()
            .padding(.top, 10)
            .zIndex(1)
            
            VStack {
                
                    HStack {
                        VStack(alignment: .leading, spacing: 8, content: {
                            Text("Color")
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                            
                            HStack(spacing: 15) {
                                ColorView(color: Color(bagData.image), selectedColor: $selectedColor)
                                ColorView(color: Color.orange, selectedColor: $selectedColor)
                                ColorView(color: Color.gray, selectedColor: $selectedColor)
                            }
                            
                        })
                        
                        Spacer(minLength: 0)
                        
                        VStack(alignment: .leading, spacing: 8, content: {
                           
                            Text("Size")
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            
                            Text("12 cm")
                                .fontWeight(.heavy)
                                .foregroundColor(.black)
                            
                        })
                        
                    }
                    .padding(.horizontal)
                    .padding(.top, isSmallDevice ? 0 : -20)
                    
                    Text("Whether you are handling to work or traveling, a trandy handbag or clutch will add as the perfect accessory with your outfit. Carry your daily essentials in style as you have a choice of shopping for bag.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                        .padding()
                    
                    
                    HStack(spacing: 20) {
                        Button(action: {
                            guard count > 0 else { return }
                            count -= 1
                        }, label: {
                            Image(systemName: "minus")
                                .font(.title2)
                                .foregroundColor(.gray)
                                .frame(width: 35, height: 35)
                                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                        })
                        
                        Text("\(count)")
                            .font(.title2)
                        
                        Button(action: {
                            guard count < 10 else { return }
                            count += 1
                        }, label: {
                            Image(systemName: "plus")
                                .font(.title2)
                                .foregroundColor(.gray)
                                .frame(width: 35, height: 35)
                                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                        })
                        
                        Spacer()
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "suit.heart.fill")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding(10)
                                .background(Color.red)
                                .clipShape(Circle())
                        })
                        
                        
                    }
                    .padding(.horizontal)
                    
                    Spacer(minLength: 0)
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("BUY NOW")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 30)
                            .background(Color(bagData.image))
                            .clipShape(Capsule())
                    })
                    .padding(.top)
                    .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 15 : 0)
                
                
            }
            .background(Color.white.clipShape(CustomCorner()).padding(.top, isSmallDevice ? -50 : -90))
            .zIndex(0)
        }
        .background(Color(bagData.image).ignoresSafeArea(.all, edges: .top))
        .background(Color.white.ignoresSafeArea(.all, edges: .bottom))
        .onAppear(perform: {
            selectedColor = Color(bagData.image)
        })
    }
}

