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
            
            LinearGradient(colors: [.red, .red, .white], startPoint: .top, endPoint: .bottom)
            
            VStack{
                Spacer()
                Spacer()
                Image(systemName: "t.square.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.white)
                    .frame(width: 200)
                
                Spacer()
                Text("Created by: Manoel Leal")
                   .foregroundColor(.white)
                
                Spacer()
            }
               
        }
        .ignoresSafeArea()
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SplashViewModel()
        SplashView(viewModel: viewModel)
    }
}
