//
//  ManagerTime.swift
//  MyTraining
//
//  Created by Manoel Leal on 25/09/22.
//

import Foundation


var kDisableTimerWhenAppIsNotActive = false

class ManagerTimer: ObservableObject {
    
    
    private enum SLTimerMode {
        case stopped
        case running
        case suspended
    }
    
 
    private weak var timer: Timer? = nil

    private var previouslyAccumulatedTime: TimeInterval = 0
    private var startDate: Date? = nil
    private var lastStopDate: Date? = nil
    private var state: SLTimerMode = .stopped

    @Published var totalAccumulatedTime: TimeInterval = 0
    @Published var finishAccumulatedTime: TimeInterval = 0

    var isSuspended: Bool { return state == .suspended }
    var isRunning: Bool { return state == .running }
    var isStopped: Bool { return state == .stopped }

    private func shutdownTimer() {
        
        let accumulatedRunningTime = Date().timeIntervalSince(startDate!)

        previouslyAccumulatedTime += accumulatedRunningTime
        totalAccumulatedTime = previouslyAccumulatedTime

    
        lastStopDate = Date()
       
        timer!.invalidate()
        timer = nil
    }
    
    func suspend() {
        if state == .running {
            shutdownTimer()
            state = .suspended
        }
    }
    
    func start() {
        if state != .running {
            startDate = Date()

            if state == .suspended && !kDisableTimerWhenAppIsNotActive {
                startDate = lastStopDate
            }
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(update)), userInfo: nil, repeats: true)
            RunLoop.current.add(timer!, forMode:RunLoop.Mode.default)
            state = .running
        }
    }
    
    func stop() {
        
        if state == .running {
            shutdownTimer()
            state = .stopped
        }
    }
    
    @objc private func update() {
        totalAccumulatedTime = previouslyAccumulatedTime + Date().timeIntervalSince(startDate!)
    }
    
    func reset() {
        state = .stopped 
        previouslyAccumulatedTime = 0
        finishAccumulatedTime = totalAccumulatedTime
        totalAccumulatedTime = 0
    }
    
}


var gInStoreTimer = ManagerTimer()
