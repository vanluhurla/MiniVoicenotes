//
//  AudioNote.swift
//  MiniVoicenotes
//
//  Created by Vanessa Lucena on 13/08/2025.
//

import SwiftUI

struct AudioNote: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let duration: TimeInterval
    let fileURL: URL
}


