//
//  ExerciseView.swift
//  MyTraining
//
//  Created by Manoel Leal on 24/09/22.
//

import SwiftUI

struct ExerciseView: View {
    
    @Environment(\.dismiss) var dismiss 
    
    @State var name: String = ""
    @State var reps: String = ""
    @State var weight: String = ""
    @State var rest: String = ""
    @State var series: String = ""
    @State var cadence: String = ""
    @State var description: String = ""
    
    @ObservedObject var viewModel: ExerciseViewModel
    
    init(viewModel: ExerciseViewModel){
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView{
            Form{
                
                HStack{
                    Text("Name: ")
                    Spacer()
                    TextField("", text: $name)
                        .multilineTextAlignment(.trailing)
                }
                
                HStack{
                    Text("Reps: ")
                    Spacer()
                    TextField("", text: $reps)
                        .multilineTextAlignment(.trailing)
                }
                
                HStack{
                    Text("Weight: ")
                    Spacer()
                    TextField("", text: $weight)
                        .multilineTextAlignment(.trailing)
                }
                                
                HStack{
                    Text("Rest: ")
                    Spacer()
                    TextField("", text: $rest)
                        .multilineTextAlignment(.trailing)
                }
                
                HStack{
                    Text("Series: ")
                    Spacer()
                    TextField("", text: $series)
                        .multilineTextAlignment(.trailing)
                }

                HStack{
                    Text("Cadence: ")
                    Spacer()
                    TextField("", text: $cadence)
                        .multilineTextAlignment(.trailing)
                }
                
                HStack{
                    Text("Description: ")
                    Spacer()
                    TextField("", text: $description)
                        .multilineTextAlignment(.trailing)
                }
                
                HStack(alignment: .center){
                    Spacer()
                    Button {
                        viewModel.add(exercise: Exercise(id: UUID(), photo: nil, name: name, reps: reps, weight: weight, rest: rest, series: series, cadence: cadence, description: description))
                        dismiss()
                    } label: {
                        Text("Save")
                            .foregroundColor(.accentColor)
                    }
                    Spacer()
                }
            
                
            }
            .navigationTitle("Exercise")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(viewModel: ExerciseViewModel())
    }
}
