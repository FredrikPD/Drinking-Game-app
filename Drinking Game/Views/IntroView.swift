//
//  IntroView.swift
//  Drinking Game
//
//  Created by Fredrik Preus Dovland on 24/02/2021.
//

import SwiftUI
import ActivityIndicatorView

struct IntroView: View {
    
    @State var animate = false
    @State var endSplash = false
    @State var loading = true
    
    var body: some View {
        ZStack {
            WelcomeView()
            
            ZStack {
                Color("Color")
                
                VStack {
                    Image("twitterbig")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: animate ? .fill :  .fit)
                        .frame(width: animate ? nil : 85, height: animate ? nil : 85)
                        
                        .scaleEffect(animate ? 3 : 1)
                        
                        .frame(width: UIScreen.main.bounds.width)
                    
                    ActivityIndicatorView(isVisible: $loading, type: .rotatingDots)
                        .frame(width: 100, height: 100, alignment: .center)
                        .foregroundColor(.white)
                }
            }
            .ignoresSafeArea(.all, edges: .all)
            .onAppear(perform: animateSplash)
            .opacity(endSplash ? 0:1)
        }
    }
    
    func animateSplash() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            
            withAnimation(Animation.easeOut(duration: 0.55)) {
                animate.toggle()
            }
            
            withAnimation(Animation.linear(duration: 0.45)) {
                loading = false
                endSplash.toggle()
            }
        }
    }
}


struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
