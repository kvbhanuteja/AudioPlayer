//
//  AudioViewModel.swift
//  AudioPlayer
//
//  Created by bhanuteja on 06/02/22.
//

import Foundation

final class AudioViewModel: ObservableObject {
    private (set) var audio: Audio
    
    init(audio: Audio) {
        self.audio = audio
    }
}


struct Audio {
    let id = 1
    let title: String
    let description: String
    let track: String
    let image: String
    let audioBy: String
    
    static let data = Audio(title: "Just relax",
                            description: "Clear your mind and slumber into nothingless. Allocate only a few moments for a quick breather.",
                            track: "magnifico",
                            image: "meditation",
                            audioBy: "Music by SERGIOACS from Pixabay")
}
