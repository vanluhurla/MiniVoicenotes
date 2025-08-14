//
//  AudioManagerProtocol.swift
//  MiniVoicenotes
//
//  Created by Vanessa Lucena on 13/08/2025.
//

import SwiftUI

protocol AudioManagerProtocol {
    var isRecording: Bool { get }
    var recordings: [AudioNote] { get }
    var isPlaying: Bool { get }
    
    func startRecording() throws
    func stopRecording() -> AudioNote?
    func playRecording(_ audioNote: AudioNote) throws
    func stopPlaying()
    func listRecordings() -> [AudioNote]
}

