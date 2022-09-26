//
//  HistoryCardViewModel.swift
//  MyTraining
//
//  Created by Manoel Leal on 25/09/22.
//

import Foundation
import SwiftUI

struct HistoryCardViewModel: Identifiable, Equatable{
    
    var id: UUID
    var time: String
    var date: Date
    var workout: Workout
    
    init(history: History){
        self.id = history.id
        self.time = history.time
        self.date = history.date
        self.workout = history.workout
    }
    
    static func < (lhs: HistoryCardViewModel, rhs: HistoryCardViewModel) -> Bool{
        return lhs.date < rhs.date
    }
    
}
