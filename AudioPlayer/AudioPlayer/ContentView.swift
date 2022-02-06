//
//  ContentView.swift
//  AudioPlayer
//
//  Created by bhanuteja on 06/02/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MeditationView(audioVM: AudioViewModel(audio: Audio.data))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
