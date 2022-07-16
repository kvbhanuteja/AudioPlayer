//
//  AudioViewModel.swift
//  AudioPlayer
//
//  Created by bhanuteja on 06/02/22.
//

import Foundation
import AVKit

final class AudioViewModel: ObservableObject {
    private (set) var audio: Audio
    
    init(audio: Audio) {
        self.audio = audio
    }
}


struct Audio: Identifiable {
    let id = UUID().uuidString
    let title: String
    let description: String
    let track: String
    let image: String
    let audioBy: String

    static let data = [Audio(title: "Just relax",
                             description: "Clear your mind and slumber into nothingless. Allocate only a few moments for a quick breather.",
                             track: "Magnifico",
                             image: "meditation",
                             audioBy: "Music by SERGIOACS from Pixabay"),
                       
                       Audio(title: "Just relax",
                             description: "Clear your mind and slumber into nothingless. Allocate only a few moments for a quick breather.",
                             track: "Meditation",
                             image: "meditation",
                             audioBy: "Music by SERGIOACS from Pixabay"),
                       
                       Audio(title: "Just relax",
                             description: "Clear your mind and slumber into nothingless. Allocate only a few moments for a quick breather.",
                             track: "Autumn Sky Meditation",
                             image: "meditation",
                             audioBy: "Music by NaturesEye from Pixabay"),
                       
                       Audio(title: "Just relax",
                             description: "Clear your mind and slumber into nothingless. Allocate only a few moments for a quick breather.",
                             track: "Summer Rain Meditation",
                             image: "meditation",
                             audioBy: "Music by NaturesEye from Pixabay")]
    
    func getData(track: String) -> (String, TimeInterval) {
            guard let url = Bundle.main.path(forResource: track, ofType: "mp3") else {
                return ("", 0)
            }
        let player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url))
        return (url, player.duration)
    }
}
