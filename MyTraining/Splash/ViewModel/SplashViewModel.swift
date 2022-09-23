//
//  SplashViewModel.swift
//  MyTraining
//
//  Created by Manoel Leal on 22/09/22.
//

import Foundation
import SwiftUI

class SplashViewModel: ObservableObject {
    
    @Published var uiState: SplashUIState = .loading
    
    func onAppear(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            self.uiState = .goToHomeScreen
        }
    }
}

extension SplashViewModel {
    func homeView() -> some View {
        return SplashViewRouter.makeHomeView()
    }
}
