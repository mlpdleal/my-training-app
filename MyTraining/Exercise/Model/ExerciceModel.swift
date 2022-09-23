//
//  Exercice.swift
//  MyTraining
//
//  Created by Manoel Leal on 23/09/22.
//

import Foundation

struct Exercise: Codable, Hashable, Identifiable{
    
    let id: UUID
    let photo: Data?
    let name: String
    let reps: String?
    let weight: String?
    let rest: String?
    let cadence: String?
    let description: String?
    
}
