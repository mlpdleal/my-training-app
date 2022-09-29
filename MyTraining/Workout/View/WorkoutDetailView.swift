//
//  WorkoutDetailView.swift
//  MyTraining
//
//  Created by Manoel Leal on 23/09/22.
//

import SwiftUI

struct WorkoutDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var id: UUID
    @ObservedObject var viewModel: WorkoutViewModel
    @ObservedObject var historyViewModel: HistoryViewModel
    @ObservedObject var chartViewModel: ChartViewModel
    
    @ObservedObject var managerTime = ManagerTime()
    
    @State private var isStarted: Bool = false
    
    var body: some View {
        
        VStack{
            if let image = viewModel.getWorkout(workoutId: id).imageData {
                Image(uiImage: UIImage(data: image)!)
                    .resizable()
                    .scaledToFit()
            } else {
                Image(systemName: "camera")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.red)
            }
            
            HStack(alignment: .center){
                Text(viewModel.getWorkout(workoutId: id).name)
                    .foregroundColor(.red)
                    .bold()
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal, 3)
            
            Text(viewModel.getWorkout(workoutId: id).description ?? "No description.")
                .font(.callout)
                .padding(.trailing, 5)
                .padding(.top, 4)
                .padding(.bottom, 4)
            
            switch managerTime.mode {
            case .stopped:
                withAnimation{
                    Button{
                        managerTime.start()
                    } label: {
                        Label("Start Routine", systemImage: "play.circle")
                            .font(.title)
                            .bold()
                    }
                }
                
            case .running:
                HStack{
                    withAnimation{
                        Button{
                            finish()
                        } label: {
                            Label("Finish", systemImage: "stop.circle")
                                .foregroundColor(.blue)
                                .font(.title)
                                .bold()
                        }
                        .padding(.horizontal)
                    }
                    
                    withAnimation{
                        Button{
                            managerTime.pause()
                        } label: {
                            Label("Pause", systemImage: "pause.circle")
                                .font(.title)
                                .foregroundColor(.yellow)
                                .bold()
                        }
                        .padding(.horizontal)
                    }
                    
                }
                
            case .paused:
                HStack{
                    withAnimation{
                        Button{
                            finish()
                        } label: {
                            Label("Finish", systemImage: "stop.circle")
                                .foregroundColor(.blue)
                                .font(.title)
                                .bold()
                        }
                        .padding(.horizontal)
                    }
                    
                    withAnimation{
                        Button{
                            managerTime.start()
                        } label: {
                            
                            Label("Continue", systemImage: "play.circle")
                                .font(.title)
                                .bold()
                        }
                        .padding(.horizontal)
                    }
                    
                }
                
            }
            
                Text(managerTime.formatTime(counter: managerTime.secondElapsed))
                    .padding(.top, 2)
            
            
            
            Spacer()
                List{
                    Section{
                    ForEach(viewModel.getWorkout(workoutId: id).exercises ?? []){ exercise in
                        
                        
                        HStack{
                            
                            if let image = exercise.photo {
                                Image(uiImage: UIImage(data: image)!)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 160, height: 90)
                                    .clipped()
                            } else {
                                Image(systemName: "camera")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.red)
                                    .frame(width: 160, height: 90)
                                    .clipped()
                            }
                            
                            VStack(alignment: .center){
                                Text(exercise.name)
                                    .foregroundColor(.red)
                                    .bold()
                                    .padding(.bottom, 2)
                                VStack(alignment: .leading){
                                    Group{
                                        Text("Reps: \(exercise.reps!.isEmpty  ? "N/a" : exercise.reps!)")
                                        Text("Weight: \(exercise.weight!.isEmpty  ? "N/a" : exercise.weight!)")
                                        Text("Rest: \(exercise.rest!.isEmpty  ? "N/a" : exercise.rest!)")
                                        Text("Series: \(exercise.series!.isEmpty  ? "N/a" : exercise.series!)")
                                        Text("Cadence: \(exercise.cadence!.isEmpty  ? "N/a" : exercise.cadence!)")
                                        if !exercise.description!.isEmpty{
                                            Text("Description: \(exercise.description!)")
                                        }
                                    }
                                    .font(.callout)
                                    .opacity(0.8)
                                    
                                }
                            }
                        }
                        
                    }
                    } header: {
                        Text("Exercises")
                    }
                }
           
         
            
            Spacer()
        }
    }
    
    func finish() {
        managerTime.stop()
        let history = History(id: UUID(), time: managerTime.formatTime(counter: managerTime.finalTime) , date: Date(), workout: viewModel.getWorkout(workoutId: id))
        historyViewModel.add(history)
        
        if chartViewModel.isWorkoutExists(workoutId: history.workout.id) {
            var chart = chartViewModel.getChartByWorkoutId(workoutId: history.workout.id)
            chart.histories.append(history)
            chartViewModel.updateChart(chartId: chart.id, chart: chart)
        } else {
            var histories: [History] = []
            histories.append(history)
            let chart = ChartModel(id: UUID(), workout: history.workout, histories: histories)
            chartViewModel.add(chart)
        }
        
        dismiss()
    }
}

