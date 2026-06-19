//
//  PomodoroTimerViewModel.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 17/06/26.
//
import Combine
import Foundation

class PomodoroTimerViewModel: ObservableObject {
    
    @Published var timeRemaining: TimeInterval
    @Published var phase: PomodoroPhase
    @Published var isLoading: Bool = false
    
    var session: PomodoroSession
    var totalDuration: TimeInterval
    var timer: Timer? = nil
    var progress: Double {
        (self.timeRemaining / (totalDuration))
    }
    var defaultDuration: TimeInterval = 1500
    
    init() {
        self.timeRemaining = self.defaultDuration
        self.phase = .focus(duration: self.defaultDuration)
        self.session = PomodoroSession(fase: .focus(duration: self.defaultDuration), focusRoundsCompleted: 0)
        self.totalDuration = self.defaultDuration
    }
    
    func start() {
        guard timer == nil else { return }
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
            Task { @MainActor [weak self] in
                guard let self = self else { return }
                if self.timeRemaining == 0 {
                    self.session.restsGiver()
                    self.phase = self.session.fase
                    self.updateDuration()
                    self.pause()
                    return
                }
                self.timeRemaining -= 1
            }
        }
    }
    
    func pause() {
        timer?.invalidate()
        timer = nil
    }
    
    func reset() {
        self.timer?.invalidate()
        self.timer = nil
        updateDuration()
    }
    
    func skip() {
        self.session.restsGiver()
        self.phase = self.session.fase
        updateDuration()
    }
    
    func updateDuration() {
        switch phase {
        case .focus(let duration), .shortBreak(let duration), .longBreak(let duration):
            self.timeRemaining = duration
            self.totalDuration = duration
        }
    }
}
