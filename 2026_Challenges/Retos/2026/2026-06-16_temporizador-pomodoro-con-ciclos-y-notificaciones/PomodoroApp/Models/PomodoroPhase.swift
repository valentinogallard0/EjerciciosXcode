//
//  PomodoroPhase.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 17/06/26.
//

import Foundation

enum PomodoroPhase {
    case focus(duration: TimeInterval)
    case shortBreak(duration: TimeInterval)
    case longBreak(duration: TimeInterval)
}
