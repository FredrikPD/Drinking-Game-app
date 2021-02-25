//
//  WelcomeView.swift
//  Drinking Game
//
//  Created by Fredrik Preus Dovland on 24/02/2021.
//

import SwiftUI

struct WelcomeView: View {
    
    @ObservedObject var model = WelcomeCathegoriesModel()
    
    var body: some View {
        NavigationView {
            
            VStack(alignment: .center) {
                
                Text("Drinking Game")
                    .bold()
                    .padding(.top, 0)
                    .font(.largeTitle)
                
                Image("BeerCheers")
                    .resizable()
                    .scaledToFill()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .frame(width: UIScreen.main.bounds.width/1.2, height: UIScreen.main.bounds.height/4, alignment: .center)
                
                GeometryReader{ geo in
                    ScrollView {
                        LazyVStack(alignment: .leading){
                            ForEach(model.cathegories) { r in
                                
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.orange)
                                        .cornerRadius(15)
                                        .padding(.horizontal)
                                        .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 3, x: -5, y: 5)
                                        .frame(width: geo.size.width, height: geo.size.height/3.2)
                                        
                                    
                                    NavigationLink(
                                        destination: DrikkelekView(),
                                        label: {
                                            VStack(alignment: .leading) {
                                                Text(r.Cathegory)
                                                    .font(.headline)
                                                    .fontWeight(.bold)
                                                    .foregroundColor(.black)
                                                    .multilineTextAlignment(.leading)
                                                    .padding(.leading)
                                                    
                                                    
                                                    
                                                Text(r.Description)
                                                    .foregroundColor(.black)
                                                    .padding(.horizontal)
                                                    .opacity(0.7)
                                            }
                                        })
                                    
                                }
                                
                                
                            }
                            
                            
                            
                        }
                        
                    }
                    .padding(.top)
                }
            }
            .navigationBarHidden(true)
        }
        
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
