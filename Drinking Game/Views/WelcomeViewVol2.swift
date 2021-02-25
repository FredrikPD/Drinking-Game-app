//
//  WelcomeViewVol2.swift
//  Drinking Game
//
//  Created by Fredrik Preus Dovland on 25/02/2021.
//

import SwiftUI

struct WelcomeViewVol2: View {
    @ObservedObject var model = WelcomeCathegoriesModel()
    
    var body: some View {
        VStack(spacing:0) {
            Text("Drinking Game")
                .font(.title)
                .fontWeight(.bold)
            //.multilineTextAlignment(.center)
            
            Image("BeerCheers")
                .resizable()
                .clipped()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width/1.3, height: UIScreen.main.bounds.height/4, alignment: .center)
            
            
            NavigationView {
                
                List {
                    
                    NavigationLink(
                        destination: DrikkelekView()) {
                        VStack(alignment: .leading) {
                            Text(model.cathegories[0].Cathegory)
                                .font(.title3)
                                .fontWeight(.semibold)
                            Text(model.cathegories[0].Description)
                                .opacity(0.7)
                        }
                        
                    }
                    .padding(.vertical)
                    
                    NavigationLink(
                        destination: KategoriskeDrikkelekerView()) {
                        VStack(alignment: .leading) {
                            Text(model.cathegories[1].Cathegory)
                                .font(.title3)
                                .fontWeight(.semibold)
                            Text(model.cathegories[1].Description)
                                .opacity(0.7)
                        }
                        
                    }
                    .padding(.vertical)
                    
                    NavigationLink(
                        destination: ForslagView()) {
                        VStack(alignment: .leading) {
                            Text(model.cathegories[2].Cathegory)
                                .font(.title3)
                                .fontWeight(.semibold)
                            Text(model.cathegories[2].Description)
                                .opacity(0.7)
                        }
                        
                    }
                    .padding(.vertical)
                    
                }
                
            }
            
        }
        
    }
}


struct WelcomeViewVol2_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeViewVol2()
    }
}
