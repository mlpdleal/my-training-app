//
//  WorkoutCardView.swift
//  MyTraining
//
//  Created by Manoel Leal on 23/09/22.
//

import SwiftUI

struct WorkoutCardView: View {
    
    @State private var action = false
    
    @Binding var id: UUID
    @Binding var photo: Data?
    @Binding var name: String
    @Binding var exercises: [Exercise]
    
    @ObservedObject var workoutViewModel: WorkoutViewModel
    @ObservedObject var historyViewModel: HistoryViewModel
    @ObservedObject var chartViewModel: ChartViewModel
    
    var body: some View {
        ZStack(alignment: .trailing){
            NavigationLink(destination: WorkoutDetailView(id: .constant(id), viewModel: workoutViewModel, historyViewModel: historyViewModel, chartViewModel: chartViewModel),
                           isActive: self.$action,
                           label: {
                                EmptyView()
                            })
            
            Button{
                self.action = true
            } label: {
                HStack{
                    Spacer()
                    if let image = photo {
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
                            Text(name)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.red)
                                .bold()
                                .padding(.bottom, 2)
                                                        
                            ForEach(exercises) { exercise in
                                Text("- \(exercise.name)")
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.gray)
                                    .font(.callout)
                                    
                            }
                            
                        }
                        Spacer()
                        HStack(alignment: .center){
                            
                            Button{
                                workoutViewModel.deleteWorkout(workoutId: id)
                                chartViewModel.deleteChart(chartId: chartViewModel.getChartByWorkoutId(workoutId: id).id)
                            } label: {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                        }
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

struct WorkoutCardView_Previews: PreviewProvider {
    static var previews: some View {
        
        
        WorkoutCardView(id: .constant(UUID()),
                        photo: .constant(nil),
                        name: .constant("Upper Body Routine"),
                        exercises: .constant([Exercise(id: UUID(), photo: nil, name: "Pull Up", reps: nil, weight: nil, rest: nil, series: nil, cadence: nil, description: nil)]), workoutViewModel: WorkoutViewModel(), historyViewModel: HistoryViewModel(), chartViewModel: ChartViewModel())
    }
}
