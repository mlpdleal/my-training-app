//
//  ExerciseViewModel.swift
//  MyTraining
//
//  Created by Manoel Leal on 24/09/22.
//

import Foundation
import SwiftUI

class ExerciseViewModel: ObservableObject {
    
    @Published private var exercises: [Exercise] = []
    
    func add(exercise: Exercise){
        exercises.append(exercise)
    }
    
    func getExercises() -> [Exercise]{
        return exercises
    }
    
}

extension ExerciseViewModel {
    
    func exerciseView(viewModel: ExerciseViewModel) -> some View{
        return ExerciseViewRouter.makeExerciseView(viewModel: viewModel)
    }
    
}
