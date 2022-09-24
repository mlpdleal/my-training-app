//
//  SplashView.swift
//  MyTraining
//
//  Created by Manoel Leal on 22/09/22.
//

import SwiftUI

struct SplashView: View {
    
    @ObservedObject var viewModel: SplashViewModel
    
    var body: some View {
        Group{
            switch viewModel.uiState {
            case .loading:
                loadingView()
            case .goToHomeScreen: 
                viewModel.homeView()
            }
        }
        .onAppear(perform: viewModel.onAppear)
        
    }
    
}

extension SplashView {
    func loadingView() -> some View {
        ZStack{
            Image("logo")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            
            Text("Created by: Manoel Leal")
                .foregroundColor(.white)
                .padding(.top, 600)
               
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SplashViewModel()
        SplashView(viewModel: viewModel)
    }
}
