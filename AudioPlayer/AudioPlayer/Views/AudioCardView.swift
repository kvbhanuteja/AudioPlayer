//
//  AudioCardView.swift
//  AudioPlayer
//
//  Created by bhanuteja on 16/07/22.
//

import SwiftUI

struct AudioCardView: View {
    var audio: Audio
    var body: some View {
        HStack {
            ZStack {
                Image(systemName: "square.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.white)
                
            Image(systemName: "music.note")
                .font(.system(size: 40))
                .foregroundColor(.black)
            }
            VStack(alignment: .leading, spacing: 5) {
                Text(audio.track)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                Text(audio.audioBy)
                    .font(.caption)
            }
            Spacer()
            VStack {
                Image(systemName: "waveform")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                
            Text(DateComponentsFormatter.abbreviated.string(from: audio.getData(track: audio.track).1) ?? 0.formatted())
            }
        }
    }
}

struct AudioCardView_Previews: PreviewProvider {
    static var previews: some View {
        AudioCardView(audio: Audio.data[0])
            .preferredColorScheme(.dark)
    }
}
