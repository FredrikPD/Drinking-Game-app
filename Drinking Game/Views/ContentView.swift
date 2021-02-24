//
//  ContentView.swift
//  Drinking Game
//
//  Created by Fredrik Preus Dovland on 24/02/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var animate = false
    @State var endSplash = false
    
    var body: some View {
        ZStack {
            //Home()
            
            ZStack {
                Color("Color")
                
                Image("twitterbig")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: animate ? .fill :  .fit)
                    .frame(width: animate ? nil : 85, height: animate ? nil : 85)
                
                    .scaleEffect(animate ? 3 : 1)
                
                    .frame(width: UIScreen.main.bounds.width)
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
                endSplash.toggle()
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    var body: some View{
        VStack{
            HStack{
                
                Text("Drinking Game")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color("Color"))
                
                Spacer(minLength: 0)
            }
            .padding()
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .background(Color.white)
            
            Spacer()
        }
        .ignoresSafeArea(.all, edges: .top)
        .background(Color.black.opacity(0.06)).ignoresSafeArea(.all, edges: .all)
    }
}
