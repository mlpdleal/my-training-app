//
//  ChartDetailView.swift
//  MyTraining
//
//  Created by Manoel Leal on 28/09/22.
//


import SwiftUI
import Charts

struct ChartDetailView: View {
    
   let histories: [History]
    
    var body: some View {
        NavigationStack{
            VStack{
                animateChart()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding()
            .navigationTitle("Routine Statistic")
        }
    }
    
    @ViewBuilder
    func animateChart() -> some View {
        Chart{
            ForEach(histories){ history in
                LineMark(x: .value("Day", history.date, unit: .day),
                        y: .value("Amount Seconds", timeToInt(time: history.time)))
                
            }
        }
        .frame(height: 300)
    }
    
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

struct ChartDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ChartDetailView(histories: [History(id: UUID(),
                                            time: "00:34:45",
                                            date: Date(),
                                            workout: Workout(id: UUID(),
                                                             name: "Upper body routine",
                                                             description: "Test routine",
                                                             imageData: nil,
                                                             exercises: [Exercise(id: UUID(),
                                                                                  photo: nil,
                                                                                  name: "Pull Up",
                                                                                  reps: nil,
                                                                                  weight: nil,
                                                                                  rest: nil,
                                                                                  series: nil,
                                                                                  cadence: nil,
                                                                                  description: nil)])),
                                    History(id: UUID(),
                                            time: "00:37:45",
                                            date: Date(),
                                            workout: Workout(id: UUID(),
                                                             name: "Upper body routine",
                                                             description: "Test routine",
                                                             imageData: nil,
                                                             exercises: [Exercise(id: UUID(),
                                                                                  photo: nil,
                                                                                  name: "Pull Up",
                                                                                  reps: nil,
                                                                                  weight: nil,
                                                                                  rest: nil,
                                                                                  series: nil,
                                                                                  cadence: nil,
                                                                                  description: nil)]))])
    }
}

