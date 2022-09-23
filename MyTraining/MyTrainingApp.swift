//
//  MyTrainingApp.swift
//  MyTraining
//
//  Created by Manoel Leal on 22/09/22.
//

import SwiftUI

@main
struct MyTrainingApp: App {
    var body: some Scene {
        WindowGroup {
            SplashView(viewModel: SplashViewModel())
        }
    }
}
