//
//  HomeView.swift
//  MyTraining
//
//  Created by Manoel Leal on 22/09/22.
//

import SwiftUI

struct HomeView: View {
    
    @State var selection = 0
    
    @ObservedObject var viewModel = HomeViewModel()
    
    
    var body: some View {
        TabView(selection: $selection){
            viewModel.workoutView()
                .tabItem{
                    Image(systemName: "flame")
                    Text("Workouts")
                }
                .tag(0)
            
            viewModel.historyView()
                .tabItem{
                    Image(systemName: "clock.arrow.circlepath")
                    Text("History")
                }
            
            Text("Chart screen")
                .tabItem{
                    Image(systemName: "chart.bar")
                    Text("Charts")
                }
            
        }
        .accentColor(.red)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
