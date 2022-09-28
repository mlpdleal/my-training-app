//
//  ChartModel.swift
//  MyTraining
//
//  Created by Manoel Leal on 27/09/22.
//

import Foundation

struct Chart: Codable, Hashable, Identifiable {
    
    let id: UUID
    let workout: Workout
    var histories: [History]
}
