//
//  HistoryModel.swift
//  MyTraining
//
//  Created by Manoel Leal on 25/09/22.
//

import Foundation

struct History: Codable, Hashable, Identifiable{
    
    let id: UUID
    let time: String
    let date: Date
    let workout: Workout
    
}
