//
//  ChartCardViewModel.swift
//  MyTraining
//
//  Created by Manoel Leal on 28/09/22.
//

import Foundation

struct ChartCardViewModel: Identifiable, Equatable{
    
    let id: UUID
    let workout: Workout
    let histories: [History]
    
    init(chart: Chart){
        self.id = chart.id
        self.workout = chart.workout
        self.histories = chart.histories
    }
    
}
