// Implemented the extra feature.

import SwiftUI
import AVFoundation

struct SplashScreenView: View {
    @State var isActive: Bool = false
    @State private var glow = false
    @State private var fadeIn = false
    @State private var audioPlayer: AVAudioPlayer?
    
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            if verticalSizeClass == .compact {
                
                VStack {
                    Spacer()
                    
                    Image("0_HOD_text")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 700, height: 400)
                        .foregroundColor(.white)
                        .shadow(color: Color.white.opacity(0.8), radius: glow ? 20 : 5)
                        .scaleEffect(glow ? 1.1 : 1.0)
                        .opacity(fadeIn ? 1.0 : 0.0)
                        .onAppear {
                            withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                                self.glow.toggle()
                            }
                            withAnimation(.easeInOut(duration: 1.5)) {
                                self.fadeIn = true
                            }
                            playSound()
                        }
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
                .onDisappear {
                    audioPlayer?.stop()
                }
                
            } else {
                HStack {
                    Spacer()
                    
                    Image("0_HOD_text")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 200)
                        .foregroundColor(.white)
                        .shadow(color: Color.white.opacity(0.8), radius: glow ? 20 : 5)
                        .scaleEffect(glow ? 1.1 : 1.0)
                        .opacity(fadeIn ? 1.0 : 0.0)
                        .onAppear {
                            withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                                self.glow.toggle()
                            }
                            withAnimation(.easeInOut(duration: 1.5)) {
                                self.fadeIn = true
                            }
                            playSound()
                        }
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
                .onDisappear {
                    audioPlayer?.stop()
                }
            }
        }
    }
    
    // Function to play the hod.mp3 sound
    func playSound() {
        if let soundURL = Bundle.main.url(forResource: "hod", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.numberOfLoops = -1 // Loop the audio until stopped
                audioPlayer?.play() // Start playing the sound
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
