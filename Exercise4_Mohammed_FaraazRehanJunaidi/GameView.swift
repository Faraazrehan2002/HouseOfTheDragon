// Implemented the extra feature.

import SwiftUI
import AVFoundation

var audioPlayer: AVAudioPlayer?


struct GameView: View {
    @Environment(\.verticalSizeClass)var verticalSizeClass: UserInterfaceSizeClass?
    
    @Binding var winCountPlayer1: Int
    @Binding var winCountPlayer2: Int
    
    @State private var dragonPlayer1 = "0_HOD_logo"
    @State private var dragonPlayer2 = "0_HOD_logo"
    
    @State private var audioPlayer: AVAudioPlayer?
    @State private var isPlaying = false

    
    let dragonHierarchy = ["1_Balerion", "1_Meraxes", "1_Sheepstealer", "2_Meleys", "2_Quicksilver", "2_Silverwing", "3_Drogon", "3_Stormcloud", "3_Viserion"]
    
    var body: some View {
        
        if verticalSizeClass == .regular{
            
            VStack {
                if winCountPlayer1 == 3 || winCountPlayer2 == 3 {
                    // Show the victory screen
                    victoryView
                } else if winCountPlayer1 == 0 && winCountPlayer2 == 0 {
                    // Show the game view
                    gameView
                } else{
                    // Show the middle game view
                    middleView
                }
            }
            .tabItem {
                Image("fire_off")
                Text("Game")
            }
            
        }else{
            
            VStack {
                if winCountPlayer1 == 3 || winCountPlayer2 == 3 {
                    // Show the victory screen
                    victoryViewLandscape
                } else if winCountPlayer1 == 0 && winCountPlayer2 == 0{
                    // Show the game view
                    gameViewLandscape
                } else{
                    middleViewLandscape
                }
            }
            .tabItem {
                Image("fire_off")
                Text("Game")
            }
            
        }
        
        
    }
    
    // Separate the victory view logic
    var victoryView: some View {
        VStack {
            Image("0_HOD_text")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            HStack {
                VStack {
                    Text("Player 1")
                        .font(.custom("AcademyEngravedLETPlain", size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 128 / 255, green: 0 / 255, blue: 0 / 255))
                    
                    Image(dragonPlayer1)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                
            
                
                VStack {
                    Text("Player 2")
                        .font(.custom("AcademyEngravedLETPlain", size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 128 / 255, green: 0 / 255, blue: 0 / 255))
                    
                    Image(dragonPlayer2)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }.padding()
            
            
            Spacer()
            
            VStack {
                if(winCountPlayer1 > winCountPlayer2){
                    Text("Player 1 won! (\(winCountPlayer1) - \(winCountPlayer2))")
                        .font(.custom("AcademyEngravedLETPlain", size: 30))
                        .fontWeight(.bold)
                }else{
                    Text("Player 2 won! (\(winCountPlayer1) - \(winCountPlayer2))")
                        .font(.custom("AcademyEngravedLETPlain", size: 30))
                        .fontWeight(.bold)
                }
                
                Text("Restart the game.")
                    .font(.custom("AcademyEngravedLETPlain", size: 30))
                    .fontWeight(.bold)
            }
            
            Spacer()
            
            HStack {
                VStack {
                    Text("Restart")
                        .font(.custom("AcademyEngravedLETPlain", size: 30))
                        .fontWeight(.bold)
                    
                    Button(action: {
                        restartDragons()
                    }, label: {
                        Image("0_refresh_arrows")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    })
                }
                .padding()
                
                VStack {
                    Text("Fight")
                        .font(.custom("AcademyEngravedLETPlain", size: 30))
                        .fontWeight(.bold)
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image("0_crossing-swords")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    })
                }
                .padding()
            }
            .padding()
            
        }
        .padding()
        .onAppear {
            if !isPlaying {
                playSound()
            }
        }
        
        
    }
    
    
    // Separate the victory view landscape logic
    var victoryViewLandscape: some View {
        
        HStack{
            
            VStack{
                
                Image("0_HOD_text")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                HStack{
                    
                    VStack {
                        Text("Player 1")
                            .font(.custom("AcademyEngravedLETPlain", size: 30))
                            .fontWeight(.bold)
                        
                        Image(dragonPlayer1)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }.padding()
                    
                
                    
                    VStack {
                        Text("Player 2")
                            .font(.custom("AcademyEngravedLETPlain", size: 30))
                            .fontWeight(.bold)
                        
                        Image(dragonPlayer2)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }.padding()
                    
                }
                
                
            }
            
            
            
            VStack{
                
                VStack{
                    if(winCountPlayer1 > winCountPlayer2){
                        Text("Player 1 won! (\(winCountPlayer1) - \(winCountPlayer2))")
                            .font(.custom("AcademyEngravedLETPlain", size: 30))
                            .fontWeight(.bold)
                    }else{
                        Text("Player 2 won! (\(winCountPlayer1) - \(winCountPlayer2))")
                            .font(.custom("AcademyEngravedLETPlain", size: 30))
                            .fontWeight(.bold)
                    }
                    
                    
                    Text("Restart the game.")
                        .font(.custom("AcademyEngravedLETPlain", size: 30))
                        .fontWeight(.bold)
                }.padding()
                
                HStack{
                    
                    VStack {
                        Text("Restart")
                            .font(.custom("AcademyEngravedLETPlain", size: 30))
                            .fontWeight(.bold)
                        
                        Button(action: {
                            restartDragons()
                        }, label: {
                            Image("0_refresh_arrows")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        })
                    }
                    .padding()
                    
                    VStack {
                        Text("Fight")
                            .font(.custom("AcademyEngravedLETPlain", size: 30))
                            .fontWeight(.bold)
                        
                        Button(action: {
                            
                        }
                               , label: {
                            Image("0_crossing-swords")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        })
                    }
                    .padding()
                    
                }
                
            }
            
        }.onAppear {
            if !isPlaying {
                playSound()
            }
        }
        
    }
    
    // Seperate the regular middle game view logic
    var middleView: some View{
        
        VStack {
            Image("0_HOD_text")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            HStack {
                VStack {
                    Text("Player 1")
                        .font(.custom("AcademyEngravedLETPlain", size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 128 / 255, green: 0 / 255, blue: 0 / 255))
                    
                    Image(dragonPlayer1)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                
            
                
                VStack {
                    Text("Player 2")
                        .font(.custom("AcademyEngravedLETPlain", size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 128 / 255, green: 0 / 255, blue: 0 / 255))
                    
                    Image(dragonPlayer2)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }.padding()
            
            
            Spacer()
            
            VStack {
                if let indexPlayer1 = dragonHierarchy.firstIndex(of: dragonPlayer1),
                   let indexPlayer2 = dragonHierarchy.firstIndex(of: dragonPlayer2) {
                    
                    if indexPlayer1 < indexPlayer2 {
                        Text("\(dragonPlayer1.dropFirst(2)) is stronger.")
                            .font(.custom("AcademyEngravedLETPlain", size: 30))
                            .fontWeight(.bold)
                        
                        Text("Player 1 wins the round!")
                            .font(.custom("AcademyEngravedLETPlain", size: 30))
                            .fontWeight(.bold)
                    } else {
                        Text("\(dragonPlayer2.dropFirst(2)) is stronger.")
                            .font(.custom("AcademyEngravedLETPlain", size: 30))
                            .fontWeight(.bold)
                        
                        Text("Player 2 wins the round!")
                            .font(.custom("AcademyEngravedLETPlain", size: 30))
                            .fontWeight(.bold)
                    }
                    
                } else {
                    // Fallback in case the dragons are not found in the hierarchy
                    Text("Error: Could not determine the winner.")
                        .font(.custom("AcademyEngravedLETPlain", size: 30))
                        .fontWeight(.bold)
                }
                
                
            }


            
            Spacer()
            
            HStack {
                VStack {
                    Text("Restart")
                        .font(.custom("AcademyEngravedLETPlain", size: 30))
                        .fontWeight(.bold)
                    
                    Button(action: {
                        restartDragons()
                    }, label: {
                        Image("0_refresh_arrows")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    })
                }
                .padding()
                
                VStack {
                    Text("Fight")
                        .font(.custom("AcademyEngravedLETPlain", size: 30))
                        .fontWeight(.bold)
                    
                    Button(action: {
                        fightDragons()
                    }, label: {
                        Image("0_crossing-swords")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    })
                }
                .padding()
            }
            .padding()
        }
        .padding()
        
    }
    
    // Seperate the landscape middle game view logic
    var middleViewLandscape: some View{
        
        HStack{
            
            VStack{
                
                Image("0_HOD_text")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                HStack{
                    
                    VStack {
                        Text("Player 1")
                            .font(.custom("AcademyEngravedLETPlain", size: 30))
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 128 / 255, green: 0 / 255, blue: 0 / 255))
                        
                        Image(dragonPlayer1)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }.padding()
                    
                
                    
                    VStack {
                        Text("Player 2")
                            .font(.custom("AcademyEngravedLETPlain", size: 30))
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 128 / 255, green: 0 / 255, blue: 0 / 255))
                        
                        Image(dragonPlayer2)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }.padding()
                    
                }
                
                
            }
            
            
            
            VStack{
                
                VStack {
                    if let indexPlayer1 = dragonHierarchy.firstIndex(of: dragonPlayer1),
                       let indexPlayer2 = dragonHierarchy.firstIndex(of: dragonPlayer2) {
                        
                        if indexPlayer1 < indexPlayer2 {
                            
                            Text("\(dragonPlayer1.dropFirst(2)) is stronger.")
                                .font(.custom("AcademyEngravedLETPlain", size: 30))
                                .fontWeight(.bold)
                            
                            Text("Player 1 wins the round!")
                                .font(.custom("AcademyEngravedLETPlain", size: 30))
                                .fontWeight(.bold)
                        } else {
                            
                            Text("\(dragonPlayer2.dropFirst(2)) is stronger.")
                                .font(.custom("AcademyEngravedLETPlain", size: 30))
                                .fontWeight(.bold)
                            
                            Text("Player 2 wins the round!")
                                .font(.custom("AcademyEngravedLETPlain", size: 30))
                                .fontWeight(.bold)
                        }
                        
                    } else {
                        // Fallback in case dragons aren't found in the hierarchy
                        Text("Error: Could not determine the winner.")
                            .font(.custom("AcademyEngravedLETPlain", size: 30))
                            .fontWeight(.bold)
                    }
                    
                }
                .padding()

                
                
                HStack{
                    
                    VStack {
                        Text("Restart")
                            .font(.custom("AcademyEngravedLETPlain", size: 30))
                            .fontWeight(.bold)
                        
                        Button(action: {
                            restartDragons()
                        }, label: {
                            Image("0_refresh_arrows")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        })
                    }
                    .padding()
                    
                    VStack {
                        Text("Fight")
                            .font(.custom("AcademyEngravedLETPlain", size: 30))
                            .fontWeight(.bold)
                        
                        Button(action: {
                            fightDragons()
                        }
                               , label: {
                            Image("0_crossing-swords")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        })
                    }
                    .padding()
                    
                }
                
            }
            
        }
        
    }
    
    // Separate the regular game view logic
    var gameView: some View {
        VStack {
            Image("0_HOD_text")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            HStack {
                VStack {
                    Text("Player 1")
                        .font(.custom("AcademyEngravedLETPlain", size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 128 / 255, green: 0 / 255, blue: 0 / 255))
                    
                    Image(dragonPlayer1)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                
                Spacer()
                
                VStack {
                    Text("Player 2")
                        .font(.custom("AcademyEngravedLETPlain", size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 128 / 255, green: 0 / 255, blue: 0 / 255))
                    
                    Image(dragonPlayer2)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .padding()
            
            Spacer()
            
            Text("Prepare for the battle!")
                .font(.custom("AcademyEngravedLETPlain", size: 30))
                .fontWeight(.bold)
                .padding()
            
            Spacer()
            
            HStack {
                VStack {
                    Text("Restart")
                        .font(.custom("AcademyEngravedLETPlain", size: 30))
                        .fontWeight(.bold)
                    
                    Button(action: {
                        restartDragons()
                    }, label: {
                        Image("0_refresh_arrows")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    })
                }
                .padding()
                
                VStack {
                    Text("Fight")
                        .font(.custom("AcademyEngravedLETPlain", size: 30))
                        .fontWeight(.bold)
                    
                    Button(action: {
                        fightDragons()
                    }, label: {
                        Image("0_crossing-swords")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    })
                }
                .padding()
            }
            .padding()
        }
        .padding()
    }
    
    var gameViewLandscape: some View {
        HStack {
            VStack {
                Image("0_HOD_text")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                HStack {
                    VStack {
                        Text("Player 1")
                            .font(.custom("AcademyEngravedLETPlain", size: 30))
                            .fontWeight(.bold)
                        
                        Image(dragonPlayer1)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .padding()
                    
                    VStack {
                        Text("Player 2")
                            .font(.custom("AcademyEngravedLETPlain", size: 30))
                            .fontWeight(.bold)
                        
                        Image(dragonPlayer2)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .padding()
                }
            }
            
            VStack {
                VStack {
                    Text("Prepare for the battle!")
                        .font(.custom("AcademyEngravedLETPlain", size: 30))
                        .fontWeight(.bold)
                }
                .padding()
                
                HStack {
                    VStack {
                        Text("Restart")
                            .font(.custom("AcademyEngravedLETPlain", size: 30))
                            .fontWeight(.bold)
                        
                        Button(action: {
                            restartDragons()
                        }, label: {
                            Image("0_refresh_arrows")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        })
                    }
                    .padding()
                    
                    VStack {
                        Text("Fight")
                            .font(.custom("AcademyEngravedLETPlain", size: 30))
                            .fontWeight(.bold)
                        
                        Button(action: {
                            fightDragons()
                        }, label: {
                            Image("0_crossing-swords")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        })
                    }
                    .padding()
                }
            }
        }
        
    }

    
    func fightDragons(){
        
        guard winCountPlayer1 < 3 && winCountPlayer2 < 3 else {
            return
        }
        
        playFightSound()

        
        var availableDragons = dragonHierarchy

        dragonPlayer1 = availableDragons.randomElement() ?? "1_Balerion"

    
        availableDragons.removeAll { $0 == dragonPlayer1 }

        
        dragonPlayer2 = availableDragons.randomElement() ?? "2_Meleys"

        
        let dragon1Index = dragonHierarchy.firstIndex(of: dragonPlayer1) ?? 0
        let dragon2Index = dragonHierarchy.firstIndex(of: dragonPlayer2) ?? 0

        if dragon1Index < dragon2Index {
            winCountPlayer1 += 1
        } else {
            winCountPlayer2 += 1
        }

        
    }
    
    func playFightSound() {
        if let soundURL = Bundle.main.url(forResource: "fightSound", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        } else {
            print("Sound file not found.")
        }
    }
    
    func restartDragons(){
        
        winCountPlayer1 = 0
        winCountPlayer2 = 0
        dragonPlayer1 = "0_HOD_logo"
        dragonPlayer2 = "0_HOD_logo"
        stopSound()
        
    }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "hod", withExtension: "mp3") else {
            print("Sound file not found")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = -1 
            audioPlayer?.play()
            isPlaying = true
        } catch {
            print("Error initializing audio player: \(error.localizedDescription)")
        }
    }

    func stopSound() {
        audioPlayer?.stop()
        isPlaying = false
    }

    
    
}

#Preview {
    GameView(winCountPlayer1: .constant(3), winCountPlayer2: .constant(2))
}
