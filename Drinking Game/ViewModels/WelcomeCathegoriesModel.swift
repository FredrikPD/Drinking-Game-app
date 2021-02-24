//
//  WelcomeCathegoriesModel.swift
//  Drinking Game
//
//  Created by Fredrik Preus Dovland on 24/02/2021.
//

import Foundation

class WelcomeCathegoriesModel: ObservableObject {
    @Published var cathegories = [Cathegory]()
    
    init() {
        // Parse the local json file
        
        // Create an instance of data service and get the data
        self.cathegories = CathegoryService.getLocalData()
    }
}
