//
//  AstronautView.swift
//  Moonshot
//
//  Created by Buhle Radzilani on 2024/06/17.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView{
            VStack{
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
                    .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        //adding the exclaimation saying to the content view that we are confident that armstrong will work or else the app can crash if it fails to get armstrong.
        AstronautView(astronaut: astronauts["armstrong"]!)
    }
}
