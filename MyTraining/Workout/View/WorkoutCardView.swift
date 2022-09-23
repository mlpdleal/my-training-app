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
    @Binding var description: String
    
    @ObservedObject var workoutViewModel: WorkoutViewModel
    
    var body: some View {
        ZStack(alignment: .trailing){
            NavigationLink(destination: Text("WorkoutDetail"),
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
                        VStack{
                            Text(name)
                                .foregroundColor(.red)
                            
                            Text(description)
                                .foregroundColor(.gray)
                                .bold()
                            
                        }
                        Spacer()
                        HStack(alignment: .center){
                            
                            Button{
                                workoutViewModel.deleteWorkout(workoutId: id)
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
        
        WorkoutCardView(id: .constant(UUID()), photo: .constant(nil), name: .constant("Upper Body Routine"), description: .constant("test routine"), workoutViewModel: WorkoutViewModel() )
    }
}
