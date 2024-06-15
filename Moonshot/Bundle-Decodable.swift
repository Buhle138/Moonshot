//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Buhle Radzilani on 2024/06/12.
//

import Foundation

extension Bundle {
    //We are using a generic of T (which means type) so that method could work with any type whether it's the mission or the astronauts and that type must confirm to codable since we know that both of those files are JSON files. 
    func decode<T: Codable>(_ file: String) -> T {
        
        //Get the URL
        guard let url = self.url(forResource: file, withExtension: nil) else{
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        //load the data
        guard let data = try? Data(contentsOf: url) else{
            fatalError("Failed to load \(file) from bundle")
        }
        
        //decode the data from JSON and then return the array of Astronauts
      let decoder = JSONDecoder()

        guard let loaded = try? decoder.decode(T.self, from: data) else{
            fatalError("Failed to decode \(file) form bundle.")
        }
        
        //
        
        return loaded
    }
}
