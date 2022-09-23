//
//  WorkoutView.swift
//  MyTraining
//
//  Created by Manoel Leal on 22/09/22.
//

import SwiftUI

struct WorkoutListView: View {
    
    @ObservedObject var viewModel = WorkoutViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                topContainer
                addButton
                VStack{
                    ForEach(viewModel.getWorkouts()){ workout in
                        Text(workout.name)
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
        WorkoutListView()
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
            
            Text("Workout now!")
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
            viewModel.workoutCreateView()
        } label: {
            Label("Create Workout", systemImage: "plus.app")
                
        }
        .modifier(ButtonStyle())
        .padding(.horizontal, 16)

    }
    
    
}
