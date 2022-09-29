//
//  ChartTests.swift
//  MyTrainingTests
//
//  Created by Manoel Leal on 29/09/22.
//

import XCTest
import SwiftUI
@testable import MyTraining

final class ChartTests: XCTestCase {
    
    @ObservedObject var workoutViewModel = WorkoutViewModel()
    @ObservedObject var historyViewModel = HistoryViewModel()
    @ObservedObject var chartViewModel = ChartViewModel()

    override func setUpWithError() throws {
        chartViewModel.deleteAll()
        historyViewModel.deleteAll()
        workoutViewModel.deleteAll()
    }

    override func tearDownWithError() throws {
        chartViewModel.deleteAll()
        historyViewModel.deleteAll()
        workoutViewModel.deleteAll()
    }

    func testGetEmptyChartList() throws {
        XCTAssertTrue(chartViewModel.getCharts().isEmpty)
    }

    func testAddChart() {
        let workout = Workout(id: UUID(),
                              name: "Test",
                              description: "Test",
                              imageData: nil, exercises: [Exercise(id: UUID(), photo: nil, name: "Exercise Test", reps: nil, weight: nil, rest: nil, series: nil, cadence: nil, description: nil)])
        
        let history = History(id: UUID(), time: "00:57:29", date: Date(), workout: workout)
        
        let chart = ChartModel(id: UUID(), workout: workout, histories: [history])
        
        XCTAssertTrue(chartViewModel.getCharts().isEmpty)
        
        chartViewModel.add(chart)
        
        XCTAssertTrue(!chartViewModel.getCharts().isEmpty)
    }
    
    func testGetChart() {
        
        let workout = Workout(id: UUID(),
                              name: "Test",
                              description: "Test",
                              imageData: nil, exercises: [Exercise(id: UUID(), photo: nil, name: "Exercise Test", reps: nil, weight: nil, rest: nil, series: nil, cadence: nil, description: nil)])
        
        let history = History(id: UUID(), time: "00:57:29", date: Date(), workout: workout)
        
        let chart = ChartModel(id: UUID(), workout: workout, histories: [history])
        
        XCTAssertTrue(chartViewModel.getCharts().isEmpty)
        
        chartViewModel.add(chart)
        
        XCTAssertEqual(chartViewModel.getChart(chartId: chart.id).workout.name, chart.workout.name)
        
    }
    
    

}
