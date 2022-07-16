//
//  AudioPlayerApp.swift
//  AudioPlayer
//
//  Created by bhanuteja on 06/02/22.
//

import SwiftUI

@main
struct AudioPlayerApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                AudioListView(audios: Audio.data.sorted {$0.track < $1.track})
            }
        }
    }
}
