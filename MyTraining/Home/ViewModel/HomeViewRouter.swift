//
//  HomeViewRouter.swift
//  MyTraining
//
//  Created by Manoel Leal on 22/09/22.
//

import Foundation
import SwiftUI

enum HomeViewRouter {
    
    static func makeWorkoutView(viewModel: WorkoutViewModel) -> some View{
        return WorkoutListView()
    }
    
}
