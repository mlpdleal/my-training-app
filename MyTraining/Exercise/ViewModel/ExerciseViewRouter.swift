//
//  ExerciseViewRouter.swift
//  MyTraining
//
//  Created by Manoel Leal on 24/09/22.
//

import Foundation
import SwiftUI

enum ExerciseViewRouter {
    
    static func makeExerciseView(viewModel: ExerciseViewModel) -> some View {
        return ExerciseView(viewModel: viewModel)
    }
    
}
