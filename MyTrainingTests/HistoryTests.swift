//
//  HistoryTests.swift
//  MyTrainingTests
//
//  Created by Manoel Leal on 29/09/22.
//

import XCTest
import SwiftUI
@testable import MyTraining

final class HistoryTests: XCTestCase {
    
    @ObservedObject var workoutViewModel = WorkoutViewModel()
    @ObservedObject var historyViewModel = HistoryViewModel()
    

    override func setUpWithError() throws {
        historyViewModel.deleteAll()
        workoutViewModel.deleteAll()
    }

    override func tearDownWithError() throws {
        historyViewModel.deleteAll()
        workoutViewModel.deleteAll()
    }

    func testGetEmptyList() throws {
        XCTAssertTrue(historyViewModel.getHistories().isEmpty)
    }
    
    func testAddHistory() {
        let workout = Workout(id: UUID(),
                              name: "Test",
                              description: "Test",
                              imageData: nil, exercises: [Exercise(id: UUID(), photo: nil, name: "Exercise Test", reps: nil, weight: nil, rest: nil, series: nil, cadence: nil, description: nil)])
        
        let history = History(id: UUID(), time: "00:57:29", date: Date(), workout: workout)
        
        XCTAssertTrue(historyViewModel.getHistories().isEmpty)
        
        historyViewModel.add(history)
        
        let savedHistory = historyViewModel.getHistory(historyId: history.id)
        XCTAssertEqual(savedHistory.workout.name, history.workout.name)
    }
    
    func testGetHistory(){
        let workout = Workout(id: UUID(),
                              name: "Test",
                              description: "Test",
                              imageData: nil, exercises: [Exercise(id: UUID(), photo: nil, name: "Exercise Test", reps: nil, weight: nil, rest: nil, series: nil, cadence: nil, description: nil)])
        
        let history = History(id: UUID(), time: "00:57:29", date: Date(), workout: workout)
        
        historyViewModel.add(history)
        XCTAssertEqual(historyViewModel.getHistory(historyId: history.id), history)
    }
    



}
