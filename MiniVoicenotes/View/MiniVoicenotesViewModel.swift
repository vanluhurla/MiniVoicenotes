//
//  MiniVoicenotesViewModel.swift
//  MiniVoicenotes
//
//  Created by Vanessa Lucena on 13/08/2025.
//

import SwiftUI
import Foundation

final class MiniVoicenotesViewModel: ObservableObject {

    private let audioManager: AudioManagerProtocol
    
    init(audioManager: AudioManagerProtocol) {
        self.audioManager = audioManager
    }
    
    func toggleRecording() {
        
    }
    
    func togglePlay(for recording: AudioNote) {
        
    }
    
    func loadRecordings() {
        
    }
}


