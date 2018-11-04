//
//  SoundManager.swift
//  Match App
//
//  Created by Ethan on 2018-07-17.
//  Copyright © 2018 Ethan. All rights reserved.
//

import Foundation
import AVFoundation

class SoundManager {
    static var audioPlayer:AVAudioPlayer?
    
    enum soundEffect {
        case flip
        case shuffle
        case match
        case noMatch
        case fail
    }
    
    static func playSound(_ effect:soundEffect) {
        var soundFileName = ""
        
        switch effect {
        case .flip:
            soundFileName = "cardflip"
        case .shuffle:
            soundFileName = "shuffle"
        case .match:
            soundFileName = "dingcorrect"
        case .noMatch:
            soundFileName = "dingwrong"
        case .fail:
            soundFileName = "fail"
        }
        
        let bundlePath = Bundle.main.path(forResource: soundFileName, ofType: "wav")
        
        guard bundlePath != nil else {
            print("Could not find sound file \(soundFileName) in the bundle")
            return
        }
        
        let soundURL = URL(fileURLWithPath: bundlePath!)
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.play()
        }
        catch{
            print("Could not create the audio player object for sound file \(soundFileName)")
        }
        
        
    }
    
}
