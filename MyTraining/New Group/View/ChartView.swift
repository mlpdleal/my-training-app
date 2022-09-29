//
//  ChartView.swift
//  MyTraining
//
//  Created by Manoel Leal on 27/09/22.
//

import SwiftUI

struct ChartView: View {
    
    @ObservedObject var chartViewModel: ChartViewModel
    
    var body: some View {
        NavigationStack{
            VStack{
                
                if chartViewModel.getCharts().isEmpty {
                    EmptyListView()
                } else {
                    ForEach(chartViewModel.getCharts()){ chart in
                        ChartCardView(viewModel: ChartCardViewModel(chart: chart))
                    }
                }
                
            }
            .padding()
            .navigationTitle("Statistics")
            Spacer()
        }
    }
}
    



struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(chartViewModel: ChartViewModel())
    }
}
