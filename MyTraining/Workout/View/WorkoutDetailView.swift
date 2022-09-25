//
//  WorkoutDetailView.swift
//  MyTraining
//
//  Created by Manoel Leal on 23/09/22.
//

import SwiftUI

struct WorkoutDetailView: View {
    
    @Binding var id: UUID
    @ObservedObject var viewModel: WorkoutViewModel
    
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
            
            Text(viewModel.getWorkout(workoutId: id).description)
                .font(.callout)
                .padding(.trailing, 5)
                .padding(.top, 4)
                .padding(.bottom, 4)
                
            
            Button{
                self.isStarted.toggle()
            } label: {
                if isStarted {
                    Label("Finish Routine", systemImage: "stop.circle")
                        .font(.title)
                        .bold()
                } else {
                    Label("Start Routine", systemImage: "play.circle")
                        .font(.title)
                        .bold()
                }

            }
            
            Text("00:00:00")
            
           
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
                                    Text("Reps: \(exercise.reps!.isEmpty  ? "N/a" : exercise.reps!)")
                                    Text("Weight: \(exercise.weight!.isEmpty  ? "N/a" : exercise.weight!)")
                                    Text("Rest: \(exercise.rest!.isEmpty  ? "N/a" : exercise.rest!)")
                                    Text("Series: \(exercise.series!.isEmpty  ? "N/a" : exercise.series!)")
                                    Text("Cadence: \(exercise.cadence!.isEmpty  ? "N/a" : exercise.cadence!)")
                                    Text("Description: \(exercise.description!.isEmpty  ? "N/a" : exercise.description!)")
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
}

