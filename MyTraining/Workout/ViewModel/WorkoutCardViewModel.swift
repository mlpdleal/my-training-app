//
//  WorkoutCardViewModel.swift
//  MyTraining
//
//  Created by Manoel Leal on 30/09/22.
//

import Foundation

struct WorkoutCardViewModel: Identifiable, Equatable {
 
    let id: UUID
    let name: String
    let description: String?
    let imageData: Data?
    let exercises: [Exercise]?
    
    init(workout: Workout){
        self.id = workout.id
        self.name = workout.name
        self.description = workout.description
        self.imageData = workout.imageData
        self.exercises = workout.exercises
    }
}
