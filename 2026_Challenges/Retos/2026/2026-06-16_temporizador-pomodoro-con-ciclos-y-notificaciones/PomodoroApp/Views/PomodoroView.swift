//
//  PomodoroView.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 18/06/26.
//
import SwiftUI

struct PomodoroView: View {
    @StateObject var viewModel = PomodoroTimerViewModel()
    var body: some View {
        VStack {
            Text("\(self.viewModel.timeRemaining)")
                .font(.title2.bold())
            HStack {
                Button("Start") {
                    self.viewModel.start()
                }
                Button("Stop") {
                    self.viewModel.pause()
                }
                Button("Reset") {
                    self.viewModel.reset()
                }
            }
        }
    }
}

#Preview {
    PomodoroView(viewModel: PomodoroTimerViewModel())
}
