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
                
                ScrollView {
                    
                    LazyVStack(alignment: .leading){
                        ForEach(model.cathegories) { r in
                            
                            NavigationLink(
                                destination: KategoriskeDrikkelekerView(),
                                label: {
                                    VStack(alignment: .leading) {
                                        Text(r.Cathegory)
                                            .font(.headline)
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                        Text(r.Description)
                                            .foregroundColor(.black)
                                            .opacity(0.7)
                                    }
                                })
                                .padding()
                            
                        }
                        
                        
                        
                    }
                    
                }
            }
            .navigationBarHidden(true)
            .padding(.leading)
        }
        
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
