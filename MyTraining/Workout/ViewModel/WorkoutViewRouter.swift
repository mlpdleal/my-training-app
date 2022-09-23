//
//  WorkoutViewRouter.swift
//  MyTraining
//
//  Created by Manoel Leal on 23/09/22.
//

import Foundation
import SwiftUI

enum WorkoutViewRouter {
    
    static func makeWorkoutCreateView(viewModel: WorkoutViewModel) -> some View {
        return WorkoutCreateView(viewModel: viewModel)
    }
    
}
