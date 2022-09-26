//
//  ManagerTime.swift
//  MyTraining
//
//  Created by Manoel Leal on 25/09/22.
//

import SwiftUI


class ManagerTime: ObservableObject{
    
    @Published var secondElapsed = 0.0
    @Published var finalTime = 0.0
    @Published var mode: Mode = .stopped
    var timer = Timer()
    
    func start() {
        mode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.secondElapsed += 1.0
        }
    }
    
    func stop() {
        timer.invalidate()
        finalTime = secondElapsed
        secondElapsed = 0.0
        mode = .stopped
    }
    
    func pause() {
        timer.invalidate()
        mode = .paused
    }
    
    func formatTime(counter: Double) -> String {
        let hours = Int((counter*24).truncatingRemainder(dividingBy: 24))
        let minutes = Int((counter/60).truncatingRemainder(dividingBy: 60))
        let seconds = Int(counter.truncatingRemainder(dividingBy: 60))
        let milliseconds = Int((counter*1000).truncatingRemainder(dividingBy: 1000))
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}
