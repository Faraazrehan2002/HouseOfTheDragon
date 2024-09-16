// Implemented the extra feature.


import SwiftUI

struct ScoreView: View {
    @Binding var winCountPlayer1: Int
    @Binding var winCountPlayer2: Int
    @Environment(\.verticalSizeClass)var verticalSizeClass: UserInterfaceSizeClass?
    
    var body: some View {
        
        if verticalSizeClass == .regular{
            
            VStack {
                if winCountPlayer1 == 3 || winCountPlayer2 == 3 {
                    
                    victoryScoreView
                } else if winCountPlayer1 == 0 && winCountPlayer2 == 0{
                    
                    regularScoreView
                } else{
                    middleScoreView
                }
            }
            .tabItem {
                Image("score_off")
                Text("Score")
            }
            
        }else{
            
            VStack {
                if winCountPlayer1 == 3 || winCountPlayer2 == 3 {
                    
                    victoryScoreLandscapeView
                } else if winCountPlayer1 == 0 && winCountPlayer2 == 0{
                    
                    regularScoreLandscapeView
                } else{
                    middleScoreLandscapeView
                }
            }
            .tabItem {
                Image("score_off")
                Text("Score")
            }
            
        }
        
    }
    
    
    private var regularScoreView: some View {
        VStack {
            Image("0_HOD_text")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            VStack {
                VStack {
                    Text("Player 1")
                        .font(.custom("AcademyEngravedLETPlain", size: 48))
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(Color(red: 128 / 255, green: 0 / 255, blue: 0 / 255))
                    
                    HStack {
                        ForEach(0..<3) { _ in
                            Image("0_HOD_logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .opacity(0.5)
                        }
                    }
                }
                .padding()
                
                VStack {
                    Text("Player 2")
                        .font(.custom("AcademyEngravedLETPlain", size: 48))
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(Color(red: 128 / 255, green: 0 / 255, blue: 0 / 255))
                    
                    HStack {
                        ForEach(0..<3) { _ in
                            Image("0_HOD_logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .opacity(0.5)
                        }
                    }
                }
                .padding()
            }
            Spacer()
        }
    }
    
    // Regular Score Landscape View
    private var regularScoreLandscapeView: some View {
        

        
        VStack {
        
            Spacer(minLength: 40)
            
            VStack{
                
                Image("0_HOD_text")
                    .resizable()
                    .scaledToFill()
                
                Spacer(minLength: 20)
                    
                
                HStack{
                    
                    VStack{
                        
                        Text("Player 1")
                            .font(.custom("AcademyEngravedLETPlain", size: 48))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color(red: 128 / 255, green: 0 / 255, blue: 0 / 255))
                        
                        Spacer(minLength: 2)
                        
                        HStack {
                        
                            ForEach(0..<3) { _ in
                                Image("0_HOD_logo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .opacity(0.5)
                            }
                            
                        }
                        
                        
                        
                        
                    }.padding()
                    
                    
                    VStack{
                        
                        Text("Player 2")
                            .font(.custom("AcademyEngravedLETPlain", size: 48))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color(red: 128 / 255, green: 0 / 255, blue: 0 / 255))
                        
                        Spacer(minLength: 2)
                        
                        HStack {
                            
                            ForEach(0..<3) { _ in
                                Image("0_HOD_logo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .opacity(0.5)
                            }
                            
                        }
                    }.padding()
                    
                }.padding()
                
                
                
            }
                
        
        }.padding()
        
        
    }
    
    
    // Middle Score View
    private var middleScoreView: some View {
        VStack {
            Image("0_HOD_text")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            VStack {
                VStack {
                    Text("Player 1")
                        .font(.custom("AcademyEngravedLETPlain", size: 48))
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(Color(red: 128 / 255, green: 0 / 255, blue: 0 / 255))
                    
                    HStack {
                        ForEach(0..<3) { index in
                            Image("0_HOD_logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .opacity(index < winCountPlayer1 ? 1.0 : 0.5)
                        }
                    }
                }
                .padding()
                
                VStack {
                    Text("Player 2")
                        .font(.custom("AcademyEngravedLETPlain", size: 48))
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(Color(red: 128 / 255, green: 0 / 255, blue: 0 / 255))
                    
                    HStack {
                        ForEach(0..<3) { index in
                            Image("0_HOD_logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .opacity(index < winCountPlayer2 ? 1.0 : 0.5)
                        }
                    }

                }
                .padding()
            }
            Spacer()
        }
    }
    
    // Middle Score Landscape View
    private var middleScoreLandscapeView: some View {
        VStack {
            Spacer(minLength: 40) // Adjusted spacing at the top

            VStack {
                Image("0_HOD_text")
                    .resizable()
                    .scaledToFill()
            }

            Spacer(minLength: 20)

            HStack {
                VStack {
                    Text("Player 1")
                        .font(.custom("AcademyEngravedLETPlain", size: 48))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 128 / 255, green: 0 / 255, blue: 0 / 255))
                    
                    Spacer(minLength: 2)
                    
                    HStack {
                        ForEach(0..<3) { index in
                            Image("0_HOD_logo")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .opacity(index < winCountPlayer1 ? 1.0 : 0.5)
                        }
                    }

                }.padding()

                VStack {
                    Text("Player 2")
                        .font(.custom("AcademyEngravedLETPlain", size: 48))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 128 / 255, green: 0 / 255, blue: 0 / 255))
                    
                    Spacer(minLength: 2)
                    
                    HStack {
                        ForEach(0..<3) { index in
                            Image("0_HOD_logo")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .opacity(index < winCountPlayer2 ? 1.0 : 0.5)
                        }
                    }
                }.padding()
            }
            .padding()
            
        }.padding()
    }

    
    
    // Victory Score View
    private var victoryScoreView: some View {
        VStack {
            Image("0_HOD_text")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            VStack {
                VStack {
                    Text("Player 1")
                        .font(.custom("AcademyEngravedLETPlain", size: 48))
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(Color(red: 128 / 255, green: 0 / 255, blue: 0 / 255))
                    
                    HStack {
                        ForEach(0..<max(winCountPlayer1, 3)) { index in
                            if winCountPlayer1 > winCountPlayer2 || index < winCountPlayer1 {
                                Image("0_HOD_logo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            } else {
                                Image("0_HOD_logo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .opacity(0.5)
                            }
                        }
                    }
                }
                .padding()
                
                VStack {
                    Text("Player 2")
                        .font(.custom("AcademyEngravedLETPlain", size: 48))
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(Color(red: 128 / 255, green: 0 / 255, blue: 0 / 255))
                    
                    HStack {
                        ForEach(0..<max(winCountPlayer2, 3)) { index in
                            if winCountPlayer2 > winCountPlayer1 || index < winCountPlayer2 {
                                Image("0_HOD_logo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            } else {
                                Image("0_HOD_logo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .opacity(0.5)
                            }
                        }
                    }
                }
                .padding()
            }
            Spacer()
        }
    }
    

    // Victory Score Landscape View
    private var victoryScoreLandscapeView: some View {
        VStack {
            Spacer(minLength: 40)

            VStack {
                Image("0_HOD_text")
                    .resizable()
                    .scaledToFill()
            }

            Spacer(minLength: 20)

            HStack {
                VStack {
                    Text("Player 1")
                        .font(.custom("AcademyEngravedLETPlain", size: 48))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 128 / 255, green: 0 / 255, blue: 0 / 255))
                    
                    Spacer(minLength: 2)
                    
                    HStack {
                        ForEach(0..<max(winCountPlayer1, 3)) { index in
                            Image("0_HOD_logo")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .opacity((winCountPlayer1 > winCountPlayer2 || index < winCountPlayer1) ? 1 : 0.5)
                        }
                    }
                }.padding()

                VStack {
                    Text("Player 2")
                        .font(.custom("AcademyEngravedLETPlain", size: 48))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 128 / 255, green: 0 / 255, blue: 0 / 255))
                    
                    Spacer(minLength: 2)
                    
                    HStack {
                        ForEach(0..<max(winCountPlayer2, 3)) { index in
                            Image("0_HOD_logo")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .opacity((winCountPlayer2 > winCountPlayer1 || index < winCountPlayer2) ? 1 : 0.5)
                        }
                    }
                }.padding()
            }
            .padding()
            
        }.padding() 
    }

}

#Preview {
    ScoreView(winCountPlayer1: .constant(3), winCountPlayer2: .constant(2))
}
