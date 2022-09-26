//
//  HomeViewModel.swift
//  MyTraining
//
//  Created by Manoel Leal on 22/09/22.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @ObservedObject var workoutViewModel = WorkoutViewModel()
    @ObservedObject var historyViewModel = HistoryViewModel()
    
}

extension HomeViewModel {
    
    func workoutView() -> some View {
        return HomeViewRouter.makeWorkoutView(viewModel: workoutViewModel, historyViewModel: historyViewModel)
    }
    
    func historyView() -> some View {
        return HomeViewRouter.makeHistoryView(viewModel: historyViewModel)
    }
    
}
