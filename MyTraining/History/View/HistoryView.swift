//
//  HistoryView.swift
//  MyTraining
//
//  Created by Manoel Leal on 25/09/22.
//

import SwiftUI

struct HistoryView: View {
    
    @ObservedObject var viewModel: HistoryViewModel
    
    init(viewModel: HistoryViewModel){
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack{
                ForEach(viewModel.getHistories()){ history in
                    Text(history.time)
                    Text(history.workout.name)
                }
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(viewModel: HistoryViewModel())
    }
}
