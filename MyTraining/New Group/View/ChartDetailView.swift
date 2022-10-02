//
//  ChartDetailView.swift
//  MyTraining
//
//  Created by Manoel Leal on 28/09/22.
//


import SwiftUI
import Charts

struct ChartDetailView: View {
    
   let chartItens: [ChartItemModel]
    
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
            ForEach(chartItens){ chartItem in
                BarMark(x: .value("Day", chartItem.date.formatted(date: .abbreviated,
                                                                time: .omitted)),
                        y: .value("Amount Seconds", Int(chartItem.time)))
                
            }
        }
        .frame(height: 300)
    }
    
}

struct ChartDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ChartDetailView(chartItens: [ ChartItemModel(id: UUID(),
                                                     time: TimeInterval(10),
                                                     date: Date())
        
        ])
    }
}

