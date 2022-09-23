//
//  MyTrainingTests.swift
//  MyTrainingTests
//
//  Created by Manoel Leal on 23/09/22.
//

import XCTest
import SwiftUI
@testable import MyTraining

final class MyTrainingTests: XCTestCase {
    
    @ObservedObject var viewModel = WorkoutViewModel()
    

    override func setUpWithError() throws {
        viewModel.deleteAll()
    }

    override func tearDownWithError() throws {
        viewModel.deleteAll()
    }

    func testExample() throws {
        XCTAssertTrue(viewModel.getWorkouts().isEmpty)
    }
    
    func testAddWorkout(){
        let workout = Workout(id: UUID(),
                              name: "Test",
                              description: "Test",
                              imageData: nil)
        
        XCTAssertTrue(viewModel.getWorkouts().isEmpty)
        
        viewModel.add(workout)
        let workouts = viewModel.getWorkouts()
        let newWorkout = workouts.filter { $0.id == workout.id }
        XCTAssertEqual(newWorkout[0].id, workout.id)
    }



}
