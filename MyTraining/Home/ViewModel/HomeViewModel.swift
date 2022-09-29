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
    @ObservedObject var chartViewModel = ChartViewModel()
    
}

extension HomeViewModel {
    
    func workoutView() -> some View {
        return HomeViewRouter.makeWorkoutView(viewModel: workoutViewModel, historyViewModel: historyViewModel, chartViewModel: chartViewModel)
    }
    
    func historyView() -> some View {
        return HomeViewRouter.makeHistoryView(viewModel: historyViewModel)
    }
    
    func chartView() -> some View {
        return HomeViewRouter.makeChartView(chartViewModel: chartViewModel)
    }
    
}
