//
//  HomeViewRouter.swift
//  MyTraining
//
//  Created by Manoel Leal on 22/09/22.
//

import Foundation
import SwiftUI

enum HomeViewRouter {
    
    static func makeWorkoutView(viewModel: WorkoutViewModel, historyViewModel: HistoryViewModel) -> some View{
        return WorkoutListView(viewModel: viewModel, historyViewModel: historyViewModel)
    }
    
    static func makeHistoryView(viewModel: HistoryViewModel) -> some View {
        return HistoryView(viewModel: viewModel)
    }
    
}
