//
//  ChartViewModel.swift
//  MyTraining
//
//  Created by Manoel Leal on 27/09/22.
//

import Foundation
import SwiftUI

class ChartViewModel: ObservableObject{
    
    @Published private var charts: [Chart]
    
    let savePath = FileManager.documentsDirectory.appendingPathComponent("Charts")
    
    init(){
        do{
            let data = try Data(contentsOf: savePath)
            charts = try JSONDecoder().decode([Chart].self, from: data)
        } catch {
            charts = []
        }
    }
    
   func timeToInt(time: String) -> Int{
        var seconds = 0
        var minutes = 0
        var hours = 0
        
        let times = time.split(separator: ":")
        
        hours = (Int(times[0]) ?? 0) * 60
        minutes = ((Int(times[1]) ?? 0) + hours) * 60
        seconds = (Int(times[2]) ?? 0) + minutes
        
        return seconds
    }
    
    private func save() {
        do {
            let data = try JSONEncoder().encode(charts)
            try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Unable to save data")
        }
    }
    
    func add(_ chart: Chart){
        objectWillChange.send()
        charts.append(chart)
        save()
    }
    
    func deleteAll() {
        objectWillChange.send()
        charts.removeAll()
        save()
    }
    
    func getCharts() -> [Chart] {
        return charts
    }
    
    private func getChartIndex(chartId: UUID) -> Int{
        return charts.firstIndex{ $0.id == chartId }!
    }
    
    private func getChartIndex(workoutId: UUID) -> Int {
        return charts.firstIndex { $0.workout.id == workoutId }!
    }
    
    func isWorkoutExists(workoutId: UUID) -> Bool {
        return charts.contains { $0.workout.id == workoutId }
    }
    
    func getChart(chartId: UUID) -> Chart {
        let index = getChartIndex(chartId: chartId)
        return charts[index]
    }
    
    func getChartByWorkoutId(workoutId: UUID) -> Chart {
        let index = getChartIndex(workoutId: workoutId)
        return charts[index]
    }
    
    func updateChart(chartId: UUID, chart: Chart) {
        let index = getChartIndex(chartId: chartId)
        charts[index] = chart
        save()
    }
    
    
}
