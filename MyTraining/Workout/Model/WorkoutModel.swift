//
//  WorkoutModel.swift
//  MyTraining
//
//  Created by Manoel Leal on 22/09/22.
//

import Foundation

struct Workout: Codable, Hashable, Identifiable{
    
    let id: UUID
    let name: String
    let description: String
    let imageData: Data?
    let exercises: [Exercise]?
}
