//
//  HistoryView.swift
//  MyTraining
//
//  Created by Manoel Leal on 25/09/22.
//

import SwiftUI

struct HistoryView: View {
    
    @ObservedObject var viewModel: HistoryViewModel
    
    @State private var showingAlert: Bool = false
    
    init(viewModel: HistoryViewModel){
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView{
            VStack{
                if viewModel.getHistories().isEmpty{
                    EmptyListView()
                } else{
                        VStack{
                            List{
                                ForEach(viewModel.getHistories().sorted{ $0.date > $1.date}){ history in
                                    HistoryCardView(viewModel: HistoryCardViewModel(history: history))
                                }
                                
                            }
                        }
                        
                }
                
                if !viewModel.getHistories().isEmpty{
                    Button{
                        self.showingAlert = true
                    } label: {
                        Label("Delete all histories", systemImage: "trash")
                    }
                    .modifier(ButtonStyle())
                    .padding(.horizontal, 16)
                    .padding(.bottom, 10)
                    .alert("Would you like to delete all items?", isPresented: $showingAlert){
                        Button("Delete", role: .destructive) {
                            viewModel.deleteAll()
                        }
                        
                        Button(role: .cancel) {} label: {
                            Text("Cancel")
                            
                        }
                    } message: {
                        Text("All histories will be deleted!")
                    }
                }
                
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
