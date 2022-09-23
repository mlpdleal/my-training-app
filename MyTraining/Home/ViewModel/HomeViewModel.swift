//
//  HomeViewModel.swift
//  MyTraining
//
//  Created by Manoel Leal on 22/09/22.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    let workoutViewModel = WorkoutViewModel()
    
}

extension HomeViewModel {
    
    func workoutView() -> some View {
        return HomeViewRouter.makeWorkoutView(viewModel: workoutViewModel)
    }
    
}
