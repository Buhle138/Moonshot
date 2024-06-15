//
//  Mission.swift
//  Moonshot
//
//  Created by Buhle Radzilani on 2024/06/12.
//

import Foundation

struct CrewRole: Codable{
    let name: String
    let role: String
}

struct Mission: Codable, Identifiable{
    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String{
        "apollo\(id)"
    }
}
