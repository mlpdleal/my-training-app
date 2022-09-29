//
//  ChartCardView.swift
//  MyTraining
//
//  Created by Manoel Leal on 28/09/22.
//

import SwiftUI

struct ChartCardView: View {
    
    let viewModel: ChartCardViewModel
    
    @State private var action = false
    
    var body: some View {
        ZStack(alignment: .trailing){
            NavigationLink(destination: ChartDetailView(),
                           isActive: self.$action,
                           label: {
                                EmptyView()
                            })
            
            Button{
                self.action = true
            } label: {
                HStack{
                    Spacer()
                    if let image = viewModel.workout.imageData {
                        Image(uiImage: UIImage(data: image)!)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 45)
                            .clipped()
                    } else {
                        Image(systemName: "camera")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 45)
                            .clipped()
                        
                    }
                    
                    Spacer()
                    Spacer()
                    HStack(alignment: .top){
                        VStack(alignment: .leading){
                            Text(viewModel.workout.name)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.red)
                                .bold()
                                .padding(.bottom, 2)
                           
                            if viewModel.workout.exercises != nil {
                                ForEach(viewModel.workout.exercises!) { exercise in
                                    Text("- \(exercise.name)")
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(.gray)
                                        .font(.callout)
                            }
                                    
                            }
                            
                        }
                        Spacer()

                    }
                    
                    Spacer()
                }
                .padding()
                .cornerRadius(4.0)
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 4.0)
                .stroke(Color.red.opacity(0.5), lineWidth: 1.4)
                .shadow(color: .gray, radius: 2, x: 2.0, y: 2.0)
        )
        .padding(.horizontal, 4)
        .padding(.vertical, 4)
    }
    }


struct ChartCardView_Previews: PreviewProvider {
    static var previews: some View {
        ChartCardView(viewModel:
                        ChartCardViewModel(chart:
                                            Chart(id: UUID(),
                                                  workout: Workout(id: UUID(),
                                                                   name: "Upper body routine",
                                                                   description: "Test routine",
                                                                   imageData: nil,
                                                                   exercises: [Exercise(id: UUID(),
                                                                                        photo: nil,
                                                                                        name: "Pull Up",
                                                                                        reps: nil,
                                                                                        weight: nil,
                                                                                        rest: nil,
                                                                                        series: nil,
                                                                                        cadence: nil,
                                                                                        description: nil)]),
                                                  histories: [History(id: UUID(),
                                                                      time: "00:32:45",
                                                                      date: Date(),
                                                                      workout: Workout(id: UUID(),
                                                                                       name: "Upper body routine",
                                                                                       description: "Test routine",
                                                                                       imageData: nil,
                                                                                       exercises: [Exercise(id: UUID(), photo: nil, name: "Pull Up", reps: nil, weight: nil, rest: nil, series: nil, cadence: nil, description: nil)]))])))
    }
}
