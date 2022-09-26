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
        NavigationView{
            VStack{
                if viewModel.getHistories().isEmpty{
                    EmptyListView()
                } else{
                    ScrollView(showsIndicators: false){
                        VStack{
                            ForEach(viewModel.getHistories()){ history in
                                HistoryCardView(viewModel: HistoryCardViewModel(history: history))
                            }
                        }
                        
                    }
                    
                }
                
                Button{
                    viewModel.deleteAll()
                } label: {
                    Label("Delete all histories", systemImage: "trash")
                }
                .modifier(ButtonStyle())
                .padding(.horizontal, 16)
                .padding(.bottom, 10)
                
            }
            .navigationTitle("History")
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(viewModel: HistoryViewModel())
    }
}
