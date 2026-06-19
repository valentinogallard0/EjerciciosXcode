//
//  PomodoroSession.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 17/06/26.
//

struct PomodoroSession {
    var fase: PomodoroPhase
    var focusRoundsCompleted: Int
    
    /*
     Regla: cada 4 rondas de foco se da un descanso largo; el resto, descanso corto.
     */
    mutating func restsGiver(duration: Double = 25) {
        switch fase {
        case .focus:
            self.focusRoundsCompleted += 1
            if focusRoundsCompleted % 4 == 0 {
                self.fase = PomodoroPhase.longBreak(duration: 15)
            } else {
                self.fase = PomodoroPhase.shortBreak(duration: 5)
            }
            
        case .longBreak, .shortBreak:
            self.fase = PomodoroPhase.focus(duration: duration)
            return
        }
    }
    
}
