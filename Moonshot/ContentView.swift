//
//  ContentView.swift
//  Moonshot
//
//  Created by Buhle Radzilani on 2024/06/12.
//

import SwiftUI

struct ContentView: View {
    //swift does not know exactly which type could it be since we're working with a generic so we must enter the type. which in this case is the [String: Astronauts]
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(missions) {missions in
                        NavigationLink {
                            Text("Detail view")
                        } label: {
                            VStack{
                                Image(missions.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                
                                VStack{
                                    Text(missions.displayName)
                                        .font(.headline)
                                    
                                    Text(missions.formattedLaunchDate)
                                        .font(.caption)
                                }
                                .frame(maxWidth: .infinity)
                            }
                        }
                        
                    }
                }
                .navigationTitle("Moonshot")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
