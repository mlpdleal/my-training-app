//
//  ExerciseView.swift
//  MyTraining
//
//  Created by Manoel Leal on 24/09/22.
//

import SwiftUI

struct ExerciseView: View {
    
    @State var name: String = ""
    @State var reps: String? = nil
    @State var weight: String? = nil
    @State var rest: String? = nil
    @State var series: String? = nil
    @State var cadence: String? = nil
    @State var description: String? = nil
    
    var body: some View {
        NavigationView{
            Form{
                makeTextField(label: "Name: ", text: name)
                makeTextField(label: "Reps: ", text: reps ?? "0")
                makeTextField(label: "Weight: ", text: weight ?? "0.0")
                makeTextField(label: "Rest: ", text: rest ?? "0")
                makeTextField(label: "Series: ", text: series ?? "0")
                makeTextField(label: "Cadence: ", text: cadence ?? "0")
                makeTextField(label: "Description: ", text: description ?? "0")
                
                HStack(alignment: .center){
                    Spacer()
                    Button {
                        
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

extension ExerciseView{
    
    func makeTextField(label: String, text: String) -> some View {
        HStack{
            Text(label)
            Spacer()
            TextField("", text: .constant(text))
                .multilineTextAlignment(.trailing)
        }
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView()
    }
}
