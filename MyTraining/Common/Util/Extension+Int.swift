//
//  Extension+Int.swift
//  MyTraining
//
//  Created by Manoel Leal on 28/09/22.
//

import Foundation

extension Int {
    
    func timeToInt(time: String) -> Int{
         var seconds = 0
         var minutes = 0
         var hours = 0
         
         let times = time.split(separator: ":")
         
         hours = (Int(times[0]) ?? 0) * 60
         minutes = ((Int(times[1]) ?? 0) + hours) * 60
         seconds = (Int(times[2]) ?? 0) + minutes
         
         return seconds
     }
    
}
