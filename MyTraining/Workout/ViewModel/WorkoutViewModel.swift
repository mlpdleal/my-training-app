//
//  WorkoutViewModel.swift
//  MyTraining
//
//  Created by Manoel Leal on 22/09/22.
//

import Foundation
import SwiftUI

class WorkoutViewModel: ObservableObject{
    
    private var workouts: Set<Workout>
    
    let savePath = FileManager.documentsDirectory.appendingPathComponent("Workouts")
    
    init(){
        do{
            let data = try Data(contentsOf: savePath)
            workouts = try JSONDecoder().decode(Set<Workout>.self, from: data)
        } catch {
            workouts = []
        }
    }

    
}

extension WorkoutViewModel {
    
    func add(_ workout: Workout){
        objectWillChange.send()
        workouts.insert(workout)
        save()
    }
    
    func getWorkouts() -> [Workout] {
        
        var workoutsArray: [Workout] = []
        
        for workout in workouts {
            workoutsArray.append(workout)
        }
        
        return workoutsArray
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
    
    func workoutCreateView() -> some View {
        return WorkoutViewRouter.makeWorkoutCreateView()
    }
    
}

