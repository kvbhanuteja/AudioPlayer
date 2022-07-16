//
//  PlayerView.swift
//  AudioPlayer
//
//  Created by bhanuteja on 06/02/22.
//

import SwiftUI
import AVKit

struct PlayerView: View {
    var audioVM: AudioViewModel
    @State private var value: Double = 0.0
    @Environment(\.dismiss) var dismiss
    @State var player: AVAudioPlayer!
    @State var playing = true
    @State var currentDuartion: TimeInterval = 0
    @State var duration: TimeInterval = 0
    @State var numberOfLoops = 0

    var body: some View {
        ZStack {
            Image("playerBg")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea()
            
            //Blur effect
                Rectangle()
                .background(.thinMaterial)
                .opacity(0.25)
                .ignoresSafeArea()

            VStack(spacing: 32) {
                // Cross button
                HStack {
                    Button {
                        self.player.stop()
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                VStack {
                Text(audioVM.audio.title)
                    .font(.title)
                    .foregroundColor(.white)
                    Text("Playing \(audioVM.audio.track)")
                        .font(.caption)
                        .foregroundColor(.white)
                }
                Spacer()
                
                VStack(spacing: 5) {
                    // timer representaion
                    withAnimation {
                        Slider(value: $value,
                               in: 0...self.duration)
                            .accentColor(.white)
                    }

                    HStack {
                        Text(DateComponentsFormatter.positional.string(from: self.currentDuartion) ?? self.currentDuartion.formatted())
                        Spacer()
                        Text(DateComponentsFormatter.positional.string(from: self.duration) ?? self.duration.formatted())
                    }
                    .font(.caption)
                    .foregroundColor(.white)
                }
                
                HStack(spacing: UIScreen.main.bounds.width / 5 - 20) {
                    // Player control buttons
                    PlayBackControlButton(systemName: self.numberOfLoops == 0 ? "repeat" : "repeat.1") {
                        if self.numberOfLoops == 0 {
                            self.numberOfLoops = 1
                            self.player.numberOfLoops = 1
                        } else {
                            self.numberOfLoops = 0
                            self.player.numberOfLoops = 0
                        }
                    }
                    PlayBackControlButton(systemName: "gobackward.10") {
                        
                            self.player.currentTime -= 10
                    }
                    PlayBackControlButton(systemName: self.playing ? "pause.fill" :"play.fill") {
                        if self.player.isPlaying {
                            self.player.pause()
                            self.playing = false
                        } else {
                            self.player.play()
                            self.playing = true
                        }
                    }
                    PlayBackControlButton(systemName: "goforward.10") {
                        let increase = self.currentDuartion + 10
                        if increase < self.duration {
                            self.player.currentTime = increase
                        }
                    }
                    PlayBackControlButton(systemName: "stop.fill") {
                        self.player.stop()
                        self.playing = false
                    }
                }

            }
            .padding(20)
        }
        .onAppear {
            getData()
        }
    }
    
    func getData() {
            guard let url = Bundle.main.path(forResource: audioVM.audio.track, ofType: "mp3") else {
                return
            }
        self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url))
        self.player.prepareToPlay()
        self.player.play()
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
            if self.player.isPlaying {
                self.currentDuartion = self.player.currentTime
                self.duration = self.player.duration
                self.value = self.player.currentTime
            }
        }
    }
    
    func changeTheDuartion(value: TimeInterval) {
        self.player.currentTime = value
    }
}

struct PlayerView_Previews: PreviewProvider {
    static let audioVM = AudioViewModel(audio: Audio.data[0])
    static var previews: some View {
        PlayerView(audioVM: audioVM)
    }
}
