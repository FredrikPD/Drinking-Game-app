//
//  CathegoryService.swift
//  Drinking Game
//
//  Created by Fredrik Preus Dovland on 24/02/2021.
//

import Foundation

class CathegoryService {
    
    static func getLocalData() -> [Cathegory] {
        // Parse local json file
        
        
        // Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "WelcomeOptions", ofType: "json")
        
        // Check if pathString is not nil, otherwise...
        guard pathString != nil else {
            return [Cathegory]()
        }
        
        // Create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a JSIN decoder
            let decoder = JSONDecoder()
            
            do {
                let cathegoryData = try decoder.decode([Cathegory].self, from: data)
                
                for r in cathegoryData {
                    r.id = UUID()
                    
                }
                
                // Return the recipes
                return cathegoryData
            }
            
            catch {
                // error with parsing json
                print(error)
            }
        }
        catch {
            // error with getting data
            print(error)
        }
        
        return [Cathegory]()
    }
}
