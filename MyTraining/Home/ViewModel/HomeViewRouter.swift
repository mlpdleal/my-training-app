//
//  HomeViewRouter.swift
//  MyTraining
//
//  Created by Manoel Leal on 22/09/22.
//

import Foundation
import SwiftUI

enum HomeViewRouter {
    
    static func makeWorkoutView(viewModel: WorkoutViewModel, historyViewModel: HistoryViewModel, chartViewModel: ChartViewModel) -> some View{
        return WorkoutListView(viewModel: viewModel, historyViewModel: historyViewModel, chartViewModel: chartViewModel)
    }
    
    static func makeHistoryView(viewModel: HistoryViewModel) -> some View {
        return HistoryView(viewModel: viewModel)
    }
    
    static func makeChartView(chartViewModel: ChartViewModel) -> some View {
        return ChartView(chartViewModel: chartViewModel)
    }
}
