//
//  MeditationView.swift
//  AudioPlayer
//
//  Created by bhanuteja on 06/02/22.
//

import SwiftUI
import AVKit

struct MeditationView: View {
    @StateObject var audioVM: AudioViewModel
    @State private var showPlayer = false
    @State private var totalDuration: TimeInterval = 0
    var body: some View {
        VStack {
            Image(audioVM.audio.image)
                .resizable()
                .scaledToFill()
                .frame(height: UIScreen.main.bounds.height / 2.5)
            ZStack {
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Music")
                        Text(DateComponentsFormatter.abbreviated.string(from: self.totalDuration) ?? totalDuration.formatted())
                    }
                    .font(.subheadline)
                    .textCase(.uppercase)
                    .opacity(0.7)
                    Text(audioVM.audio.title)
                        .font(.title)
                    Button {
                        self.showPlayer = true
                    } label: {
                        Label("Play", systemImage: "play.fill")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(20)
                    }

                    Text(audioVM.audio.description)
                    Text(audioVM.audio.audioBy)
                    Spacer()
                }
                .foregroundColor(.white)
                .padding(20)
            }
            .frame(height: UIScreen.main.bounds.height * 2 / 3)
        }
        .background(Color(red: 24/255, green: 23/255, blue: 22/255))
        .ignoresSafeArea()
        .fullScreenCover(isPresented: $showPlayer) {
            PlayerView(audioVM: audioVM)
        }
        .onAppear {
            getData()
        }
    }
    
    func getData() {
            guard let url = Bundle.main.path(forResource: audioVM.audio.track, ofType: "mp3") else {
                return
            }
        let player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url))
        self.totalDuration = player.duration

    }
}

struct MeditationView_Previews: PreviewProvider {
    static let audioVM = AudioViewModel(audio: Audio.data)
    static var previews: some View {
        MeditationView(audioVM: audioVM)
    }
}
