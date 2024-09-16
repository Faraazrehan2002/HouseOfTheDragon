//
//  ContentView.swift
//  Exercise4_Mohammed_FaraazRehanJunaidi
//
//  Created by Faraaz Rehan Junaidi Mohammed on 9/13/24.
//

// Implemented the extra feature.

import SwiftUI

struct ContentView: View {
    
    @State private var winCountPlayer1: Int = 0
    @State private var winCountPlayer2: Int = 0
    
    var body: some View {
        VStack {
            
            TabView() {
                        
                GameView(winCountPlayer1: $winCountPlayer1, winCountPlayer2: $winCountPlayer2)
                            
                        
                ScoreView(winCountPlayer1: $winCountPlayer1, winCountPlayer2: $winCountPlayer2)
                            
                    }
            
        }
        .padding()
        

    }//view ends
    
    
}

#Preview {
    ContentView()
}
