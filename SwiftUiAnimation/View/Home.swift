//
//  Home.swift
//  SwiftUiAnimation
//
//  Created by iMac on 09/09/21.
//

import SwiftUI

struct Home: View {
    
    let animationDuration: TimeInterval = 0.85
    
    @State var firstViewDegree: Double = RotationState.showFirstView.rotationValue.0
    @State var firstViewOfset: CGFloat = RotationState.showFirstView.rotationValue.1
    @State var firstViewAnchor: UnitPoint = RotationState.showFirstView.rotationValue.2
    @State var firstViewYAxis: CGFloat = RotationState.showFirstView.rotationValue.3
    
    @State var secondViewDegree: Double = RotationState.hideSecondView.rotationValue.0
    @State var secondViewOfset: CGFloat = RotationState.hideSecondView.rotationValue.1
    @State var secondViewAnchor: UnitPoint = RotationState.hideSecondView.rotationValue.2
    @State var secondViewYAxis: CGFloat = RotationState.hideSecondView.rotationValue.3
    
    
    
    @State var selectedTab: String = scroll_tab[0]
    @Namespace var animation
    @State var show = false
    @State var selectedBag: BagModel!
    
    var body: some View {
        
        ZStack {
            Color.black.opacity(0.05).ignoresSafeArea(.all)
            ZStack {
                Color.white.ignoresSafeArea(.all)
                SideBarView(leading: 20) {
                    withAnimation(.easeInOut(duration: animationDuration)) {
                        self.changeRotationStates(stateOne: .showFirstView, stateTwo: .hideFirstView)
                    }
                }
            }
            .rotation3DEffect(
                .degrees(secondViewDegree),
                axis: (x: 0.0, y: secondViewYAxis, z: 0.0),
                anchor: secondViewAnchor)
            .offset(x: secondViewOfset)
            
            
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .top), content:  {
                
                VStack(spacing: 0) {
                    ZStack{
                        HStack(spacing: 15) {
                            Button(action: {
                                withAnimation(.easeInOut(duration: animationDuration)) {
                                    self.changeRotationStates(stateOne: .hideFirstView, stateTwo: .showSecondView)
                                }
                            }, label: {
                                Image(systemName: "line.horizontal.3.decrease")
                                    .font(.title)
                                    .foregroundColor(.black)
                            })
                            Spacer(minLength: 0)
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image(systemName: "magnifyingglass")
                                    .font(.title)
                                    .foregroundColor(.black)
                            })
                            
                            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top), content: {
                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Image(systemName: "cart")
                                        .font(.title)
                                        .foregroundColor(.black)
                                })
                                
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 15, height: 15)
                                    .offset(x: 5, y: -10)
                                
                            })
                        }
                        Text("Shop")
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                    }
                    .padding()
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .background(Color.white)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                    
                    ScrollView(.vertical, showsIndicators: false, content: {
                        VStack{
                            HStack{
                                Text("Women")
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .foregroundColor(.black)
                                Spacer()
                            }
                            .padding(.horizontal)
                            .padding(.top)
                            .padding(.bottom, 10)
                            
                            ScrollView(.horizontal, showsIndicators: false, content: {
                                HStack(spacing: 15, content: {
                                    ForEach(scroll_tab, id:\.self){ tab in
                                        TabButton(title: tab, selectedTab: $selectedTab, animation: animation)
                                    }
                                })
                                .padding(.horizontal)
                                .padding(.top, 15)
                            })
                            
                            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 2), content: {
                                
                                ForEach(bags){ bag in
                                    BagView(bagData: bag, animation: animation)
                                        .onTapGesture {
                                            withAnimation(.easeIn) {
                                                selectedBag = bag
                                                show.toggle()
                                            }
                                        }
                                }
                            })
                            .padding()
                            .padding(.top, 10)
                            
                        }
                    })
                }
                .background(Color.black.opacity(0.05)).ignoresSafeArea(.all, edges: .all)
                
                if selectedBag != nil && show{
                    DetailView(bagData: $selectedBag, show: $show, animation: animation)
                }
            })
            .rotation3DEffect(
                .degrees(firstViewDegree),
                axis: (x: 0.0, y: firstViewYAxis, z: 0.0),
                anchor: firstViewAnchor)
            .offset(x: firstViewOfset)
        }.ignoresSafeArea(.all)
    }
    
    func changeRotationStates(stateOne: RotationState, stateTwo: RotationState){
        (firstViewDegree, firstViewOfset, firstViewAnchor, firstViewYAxis) = stateOne.rotationValue
        (secondViewDegree, secondViewOfset, secondViewAnchor, secondViewYAxis) = stateTwo.rotationValue
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
