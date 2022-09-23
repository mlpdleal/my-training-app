//
//  WorkoutViewModel.swift
//  MyTraining
//
//  Created by Manoel Leal on 22/09/22.
//

import Foundation
import SwiftUI

class WorkoutViewModel: ObservableObject{
    
    @Published var workouts: [Workout]
    
    let savePath = FileManager.documentsDirectory.appendingPathComponent("Workouts")
    
    init(){
        do{
            let data = try Data(contentsOf: savePath)
            workouts = try JSONDecoder().decode([Workout].self, from: data)
        } catch {
            workouts = []
        }
    }

    
}

extension WorkoutViewModel {
    
    func add(_ workout: Workout){
        objectWillChange.send()
        workouts.append(workout)
        save()
    }
        
    func deleteAll() {
        workouts.removeAll()
    }
    
    private func save() {
        do {
            let data = try JSONEncoder().encode(workouts)
            try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }
    
}

extension WorkoutViewModel{
    
    func workoutCreateView(viewModel: WorkoutViewModel) -> some View {
        return WorkoutViewRouter.makeWorkoutCreateView(viewModel: viewModel)
    }
    
}

