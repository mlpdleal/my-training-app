//
//  WorkoutCardView.swift
//  MyTraining
//
//  Created by Manoel Leal on 23/09/22.
//

import SwiftUI

struct WorkoutCardView: View {
    
    @State private var action = false
    
    let workoutCardViewModel: WorkoutCardViewModel
    
    @ObservedObject var workoutViewModel: WorkoutViewModel
    @ObservedObject var historyViewModel: HistoryViewModel
    @ObservedObject var chartViewModel: ChartViewModel
    
    @State private var showingAlert: Bool = false
    
    var body: some View {
        ZStack(alignment: .trailing){
            NavigationLink(destination: WorkoutDetailView(workoutCardViewModel: workoutCardViewModel, viewModel: workoutViewModel, historyViewModel: historyViewModel, chartViewModel: chartViewModel),
                           isActive: self.$action,
                           label: {
                                EmptyView()
                            })
            
            Button{
                self.action = true
            } label: {
                HStack{
                    Spacer()
                    if let image = workoutCardViewModel.imageData {
                        Image(uiImage: UIImage(data: image)!)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 45)
                            .clipped()
                    } else {
                        Image(systemName: "camera")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 45)
                            .clipped()
                        
                    }
                    
                    Spacer()
                    Spacer()
                    HStack(alignment: .top){
                        VStack(alignment: .leading){
                            Text(workoutCardViewModel.name)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.red)
                                .bold()
                                .padding(.bottom, 2)
                                                        
                            ForEach(workoutCardViewModel.exercises ?? []) { exercise in
                                Text("- \(exercise.name)")
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.gray)
                                    .font(.callout)
                                    
                            }
                            
                        }
                        Spacer()
                        HStack(alignment: .center){
                            
                            Button{
                                showingAlert = true
                            } label: {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                    
                    Spacer()
                }
                .padding()
                .cornerRadius(4.0)
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 4.0)
                .stroke(Color.red.opacity(0.5), lineWidth: 1.4)
                .shadow(color: .gray, radius: 2, x: 2.0, y: 2.0)
        )
        .padding(.horizontal, 4)
        .padding(.vertical, 4)
        .alert("Would you like to delete this workout?",isPresented: $showingAlert){
            Button("Delete", role: .destructive) {
                workoutViewModel.deleteWorkout(workoutId: workoutCardViewModel.id)
                if chartViewModel.isWorkoutExists(workoutId: workoutCardViewModel.id){
                    chartViewModel.deleteChart(chartId: chartViewModel.getChartByWorkoutId(workoutId: workoutCardViewModel.id).id)
                }
            }
            
            Button("Cancel", role: .cancel) {}
        } message :{
            Text("That action will also delete all statistics of this workout!")
        }
    }
}

struct WorkoutCardView_Previews: PreviewProvider {
    static var previews: some View {
        
        
        WorkoutCardView(workoutCardViewModel: WorkoutCardViewModel(workout: Workout(id: UUID(), name: "Test", description: nil, imageData: nil, exercises: nil)), workoutViewModel: WorkoutViewModel(), historyViewModel: HistoryViewModel(), chartViewModel: ChartViewModel())
    }
}
