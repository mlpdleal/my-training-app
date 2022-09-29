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
                ForEach(chartViewModel.getCharts()){ chart in
                    ChartCardView(viewModel: ChartCardViewModel(chart: chart))
                }
            }
            .frame(alignment: .top)
            .padding()
            .navigationTitle("Statistics")
        }
    }
}
    



struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(chartViewModel: ChartViewModel())
    }
}
