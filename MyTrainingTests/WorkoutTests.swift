//
//  MyTrainingTests.swift
//  MyTrainingTests
//
//  Created by Manoel Leal on 23/09/22.
//

import XCTest
import SwiftUI
@testable import MyTraining

final class WorkoutTests: XCTestCase {
    
    @ObservedObject var viewModel = WorkoutViewModel()
    

    override func setUpWithError() throws {
        viewModel.deleteAll()
    }

    override func tearDownWithError() throws {
        viewModel.deleteAll()
    }

    func testGetEmptyWorkoutList() throws {
        XCTAssertTrue(viewModel.getWorkouts().isEmpty)
    }
    
    func testAddWorkout(){
        let workout = Workout(id: UUID(),
                              name: "Test",
                              description: "Test",
                              imageData: nil, exercises: [Exercise(id: UUID(), photo: nil, name: "Exercise Test", reps: nil, weight: nil, rest: nil, series: nil, cadence: nil, description: nil)])
        
        XCTAssertTrue(viewModel.getWorkouts().isEmpty)
        
        viewModel.add(workout)
        let workouts = viewModel.getWorkouts()
        let newWorkout = workouts.filter { $0.id == workout.id }
        XCTAssertEqual(newWorkout[0].id, workout.id)
    }
    
    func testGetWorkout() {
        let workout = Workout(id: UUID(),
                              name: "Test",
                              description: "Test",
                              imageData: nil, exercises: [Exercise(id: UUID(), photo: nil, name: "Exercise Test", reps: nil, weight: nil, rest: nil, series: nil, cadence: nil, description: nil)])
        
        viewModel.add(workout)
        XCTAssertEqual(viewModel.getWorkout(workoutId: workout.id).name, workout.name)
    }
    
    
    func testDeleteWorkout() {
        let workout = Workout(id: UUID(),
                              name: "Test",
                              description: "Test",
                              imageData: nil, exercises: [Exercise(id: UUID(), photo: nil, name: "Exercise Test", reps: nil, weight: nil, rest: nil, series: nil, cadence: nil, description: nil)])
        
        XCTAssertTrue(viewModel.getWorkouts().isEmpty)
        
        viewModel.add(workout)
        
        XCTAssertTrue(!viewModel.getWorkouts().isEmpty)
        
        viewModel.deleteWorkout(workoutId: workout.id)
        
        XCTAssertTrue(viewModel.getWorkouts().isEmpty)
        
    }



}
