//
//  AudioListView.swift
//  AudioPlayer
//
//  Created by bhanuteja on 16/07/22.
//

import SwiftUI

struct AudioListView: View {
    var audios: [Audio]
    init(audios: [Audio]) {
        self.audios = audios
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    var body: some View {
        List {
            ForEach(audios) { audio in
                NavigationLink(destination: MeditationView(audioVM: AudioViewModel(audio: audio))) {
                    AudioCardView(audio: audio)
                }
            }
            .listRowBackground(Color.clear)

        }
        .background(Image("playerBg").ignoresSafeArea())
        .navigationTitle("Meditation")
    }
}

struct AudioListView_Previews: PreviewProvider {
    static var previews: some View {
        AudioListView(audios: Audio.data)
            .preferredColorScheme(.dark)
    }
}
