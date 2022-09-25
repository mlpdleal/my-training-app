//
//  HistoryViewModel.swift
//  MyTraining
//
//  Created by Manoel Leal on 25/09/22.
//

import Foundation
import SwiftUI

class HistoryViewModel: ObservableObject {
    
    @Published private var histories: [History]
    
    let savePath = FileManager.documentsDirectory.appendingPathComponent("Histories")
    
    init(){
        do{
            let data = try Data(contentsOf: savePath)
            histories = try JSONDecoder().decode([History].self, from: data)
        } catch {
            histories = []
        }
    }
    
    private func save() {
        do {
            let data = try JSONEncoder().encode(histories)
            try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Unable to save data")
        }
    }
    
    func add(_ history: History){
        objectWillChange.send()
        histories.append(history)
        save()
    }
    
    func getHistories() -> [History] {
        return histories
    }
}

extension HistoryViewModel{
    
    func historyListView(viewModel: HistoryViewModel) -> some View {
        return HistoryViewRouter.makeHistoryListView(viewModel: viewModel)
    }
}
