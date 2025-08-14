//
//  AudioManager.swift
//  MiniVoicenotes
//
//  Created by Vanessa Lucena on 13/08/2025.
//

import Foundation
import AVFoundation

final class AudioManager: AudioManagerProtocol {
    private var recorder: AVAudioRecorder?
    private var player: AVAudioPlayer?
    
    var isRecording = false
    var recordings: [AudioNote] = []
    var isPlaying = false
    
    func startRecording() throws {
        let session = AVAudioSession.sharedInstance()
        try session.setCategory(.playAndRecord, mode: .default)
        try session.setActive(true)
        
        session.requestRecordPermission { allowed in
            if !allowed {
                print("Permissão de microfone negada")
            }
        }
        
        let filename = "Audio-\(UUID().uuidString).m4a"
        let fileURL = FileManager.default.documentDirectoryURL
            .appendingPathComponent(filename)
        
        let settings: [String: Any] = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 44100,
            AVNumberOfChannelsKey: 2,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        recorder = try AVAudioRecorder(url: fileURL, settings: settings)
        recorder?.record()
        isRecording = true
    }
    
    func stopRecording() -> AudioNote? {
        guard let recorder = recorder else { return nil }
        recorder.stop()
        isRecording = false
        
        let note = AudioNote(
            name: recorder.url.lastPathComponent,
            duration: recorder.currentTime,
            fileURL: recorder.url
        )
        
        recordings.append(note)
        return note
    }
    
    func playRecording(_ audioNote: AudioNote) throws {
        player = try AVAudioPlayer(contentsOf: audioNote.fileURL)
        player?.play()
        isPlaying = true
    }
    
    func stopPlaying() {
        player?.stop()
        isPlaying = false
    }
    
    func listRecordings() -> [AudioNote] {
        return recordings
    }
}

private extension FileManager {
    var documentDirectoryURL: URL {
        urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}

