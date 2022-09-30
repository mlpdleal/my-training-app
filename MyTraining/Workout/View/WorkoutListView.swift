//
//  WorkoutView.swift
//  MyTraining
//
//  Created by Manoel Leal on 22/09/22.
//

import SwiftUI

struct WorkoutListView: View {
    
    @ObservedObject var viewModel: WorkoutViewModel
    @ObservedObject var historyViewModel: HistoryViewModel
    @ObservedObject var chartViewModel: ChartViewModel
    
    var body: some View {
        NavigationView{
            VStack{
                topContainer
                addButton
                ScrollView(showsIndicators: false){
                    VStack{
                        ForEach(viewModel.getWorkouts()){ workout in
                            WorkoutCardView(workoutCardViewModel: WorkoutCardViewModel(workout: workout), workoutViewModel: viewModel, historyViewModel: historyViewModel, chartViewModel: chartViewModel)
                                .padding(.horizontal, 16)
                        }
                    }
                }
                .padding(.top, 12)
                Spacer()
            }
            .navigationTitle("Workouts")
            
        }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutListView(viewModel: WorkoutViewModel(), historyViewModel: HistoryViewModel(), chartViewModel: ChartViewModel())
    }
}

extension WorkoutListView {
    
    var topContainer: some View {
        VStack(alignment: .center, spacing: 12) {
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50, alignment: .center)
                .foregroundColor(.red)
            
            Text("Training now!")
                .font(.title.bold())
                .foregroundColor(.red)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 32)
        .overlay(
            RoundedRectangle(cornerRadius: 6)
                .stroke(Color.red, lineWidth: 1.5)
        )
        .padding(.horizontal, 16)
        .padding(.top, 16)
    }
    
    var addButton: some View{
        NavigationLink {
            viewModel.workoutCreateView(viewModel: viewModel)
        } label: {
            Label("Create new routine", systemImage: "plus.app")
                
        }
        .modifier(ButtonStyle())
        .padding(.horizontal, 16)

    }
    
    
}
