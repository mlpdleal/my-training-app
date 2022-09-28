//
//  ChartView.swift
//  MyTraining
//
//  Created by Manoel Leal on 27/09/22.
//

import SwiftUI
import Charts

struct ChartView: View {
    
    @ObservedObject var chartViewModel: ChartViewModel
    
    var body: some View {
        NavigationStack{
            VStack{
                //AnimatedChart()
                ForEach(chartViewModel.getCharts()){ chart in
                    Text(chart.workout.name)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding()
            .navigationTitle("Charts")
        }
    }
    
    @ViewBuilder func AnimatedChart() -> some View {
//        Chart{
//
//            }
        Text("Test")
        }
    }


struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(chartViewModel: ChartViewModel())
    }
}
