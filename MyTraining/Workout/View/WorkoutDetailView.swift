//
//  WorkoutDetailView.swift
//  MyTraining
//
//  Created by Manoel Leal on 23/09/22.
//

import SwiftUI

enum Mode {
    case running
    case stopped
    case paused
}

struct WorkoutDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let workoutCardViewModel: WorkoutCardViewModel
    
    @ObservedObject var viewModel: WorkoutViewModel
    @ObservedObject var historyViewModel: HistoryViewModel
    @ObservedObject var chartViewModel: ChartViewModel
    
    @ObservedObject var managerTimer = ManagerTimer()
    
    
    
    @State private var isStarted: Bool = false
    @State private var mode: Mode = .stopped
        
    var body: some View {
        
        VStack{
            if let image = workoutCardViewModel.imageData {
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
                Text(workoutCardViewModel.name)
                    .foregroundColor(.red)
                    .bold()
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal, 3)
            
            Text(workoutCardViewModel.description ?? "No description.")
                .font(.callout)
                .padding(.trailing, 5)
                .padding(.top, 4)
                .padding(.bottom, 4)
            
            switch mode {
            case .stopped:
                withAnimation{
                    Button{
                        managerTimer.start()
                        mode = .running
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
                            mode = .stopped
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
                            managerTimer.stop()
                            mode = .paused
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
                            mode = .stopped
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
                            managerTimer.start()
                            mode = .running
                        } label: {
                            
                            Label("Continue", systemImage: "play.circle")
                                .font(.title)
                                .bold()
                        }
                        .padding(.horizontal)
                    }
                    
                }
                
            }
            
            
            Text(timeString(accumulatedTime: managerTimer.totalAccumulatedTime))
                .padding(.top, 2)
                 

            Spacer()
                List{
                    Section{
                        ForEach(workoutCardViewModel.exercises ?? []){ exercise in
                        
                        
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
        managerTimer.reset()
        let history = History(id: UUID(), time: timeString(accumulatedTime: managerTimer.finishAccumulatedTime) , date: Date(), workout: viewModel.getWorkout(workoutId: workoutCardViewModel.id))
        historyViewModel.add(history)
        
        if chartViewModel.isWorkoutExists(workoutId: history.workout.id) {
            var chart = chartViewModel.getChartByWorkoutId(workoutId: history.workout.id)
            chart.chartItens.append(ChartItemModel(id: UUID(), time: managerTimer.finishAccumulatedTime, date: history.date))
            chartViewModel.updateChart(chartId: chart.id, chart: chart)
        } else {
            let chart = ChartModel(id: UUID(),
                                   workout: history.workout,
                                   chartItens: [ChartItemModel(id: UUID(), time: managerTimer.finishAccumulatedTime, date: history.date)])
            chartViewModel.add(chart)
        }
        
        dismiss()
    }
    
    func timeString(accumulatedTime: TimeInterval) -> String {
        let hours = Int(accumulatedTime) / 3600
        let minutes = Int(accumulatedTime) / 60 % 60
        let seconds = Int(accumulatedTime) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
}

