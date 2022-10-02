//
//  ChartItemModel.swift
//  MyTraining
//
//  Created by Manoel Leal on 02/10/22.
//

import Foundation

struct ChartItemModel: Codable, Identifiable, Equatable, Hashable {
    
    let id: UUID
    let time: TimeInterval
    let date: Date
}
