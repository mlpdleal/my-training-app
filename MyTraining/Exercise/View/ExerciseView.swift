//
//  ExerciseView.swift
//  MyTraining
//
//  Created by Manoel Leal on 24/09/22.
//

import SwiftUI
import PhotosUI

struct ExerciseView: View {
    
    @Environment(\.dismiss) var dismiss 
    
    @State var photo: Data? = nil
    @State var name: String = ""
    @State var reps: String = ""
    @State var weight: String = ""
    @State var rest: String = ""
    @State var series: String = ""
    @State var cadence: String = ""
    @State var description: String = ""
    
    @ObservedObject var viewModel: ExerciseViewModel
    
    @StateObject var imagePicker = ImagePicker()
    
    init(viewModel: ExerciseViewModel){
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView{
            Form{
                
                    PhotosPicker(selection: $imagePicker.imageSelection){
                        
                        if let image = imagePicker.image {
                            HStack{
                                Spacer()
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 320, height: 180)
                                
                                Spacer()
                            }
                        } else {
                            HStack{
                                Spacer()
                                VStack{
                                    Image(systemName: "camera.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .foregroundColor(.accentColor)
                                    
                                    Text("Click here to upload image")
                                }
                                Spacer()
                            }
                        }
                    }
                
                
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
                    
                        if let image = imagePicker.imageData {
                            self.photo = image
                        }
                        
                        viewModel.add(exercise: Exercise(id: UUID(), photo: photo, name: name, reps: reps, weight: weight, rest: rest, series: series, cadence: cadence, description: description))
                        dismiss()
                    } label: {
                        Text("Save")
                            .foregroundColor(.blue)
                            .opacity(name.isEmpty ? 0.5 : 1.0)
                    }
                    .disabled(name.isEmpty)
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
