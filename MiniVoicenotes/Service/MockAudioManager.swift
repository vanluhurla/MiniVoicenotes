//
//  MockAudioManager.swift
//  MiniVoicenotes
//
//  Created by Vanessa Lucena on 13/08/2025.
//

import SwiftUI

final class MockAudioManager: AudioManagerProtocol {
    var isRecording = false
    var recordings: [AudioNote] = []
    var isPlaying = false
    
    func startRecording() throws {
        isRecording = true
    }
    
    func stopRecording() -> AudioNote? {
        isRecording = false
        
        let tempFileURL = FileManager.default.temporaryDirectory.appendingPathComponent("MockRecording.m4a")
        
        let mock = AudioNote(
            name: "Mock Recording",
            duration: 3.0,
            fileURL: tempFileURL
        )
        recordings.append(mock)
        return mock
    }
    
    func playRecording(_ audioNote: AudioNote) throws {
        isPlaying = true
    }
    
    func stopPlaying() {
        isPlaying = false
    }
    
    func listRecordings() -> [AudioNote] {
        return recordings
    }
}



