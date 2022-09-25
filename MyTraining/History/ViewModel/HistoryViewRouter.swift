//
//  HistoryViewRouter.swift
//  MyTraining
//
//  Created by Manoel Leal on 25/09/22.
//

import Foundation
import SwiftUI

enum HistoryViewRouter {
    
    static func makeHistoryListView(viewModel: HistoryViewModel) -> some View {
        return HistoryView(viewModel: viewModel)
    }
    
}
