//
//  WorkoutCreateView.swift
//  MyTraining
//
//  Created by Manoel Leal on 22/09/22.
//

import SwiftUI

struct WorkoutCreateView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.dismiss) var dismiss
    
    @State private var shouldPresentCamera = false
    
    @State var name: String = ""
    @State var description: String = ""
    
    @ObservedObject var viewModel: WorkoutViewModel
    
    init(viewModel: WorkoutViewModel){
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(alignment: .center, spacing: 12){
                Button {
                    self.shouldPresentCamera = true
                } label: {
                    VStack {
                        Image(systemName: "camera.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.red)
                        
                        Text("Click here to send")
                            .foregroundColor(.red)
                    }
                }
                .padding(.bottom, 12)
            }
            
            makeTextField("Type here the name of the workout", text: $name)
            makeTextEditor("Type bellow the description", text: $description)
            
            VStack{
                
                Button{
                    let workout = Workout(id: UUID(), name: name, description: description, imageData: nil)
                    viewModel.add(workout)
                    dismiss()

                } label: {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .padding(.horizontal, 16)
                        .font(.title3.bold())
                        .background(.red)
                        .foregroundColor(.white)
                        .cornerRadius(4.0)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                
                Button("Cancel"){
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.15){
                        withAnimation(.easeOut(duration: 2)){
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
                .padding(.vertical, 8)
            }
           
            
        }
    }
}

struct WorkoutCreateView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutCreateView(viewModel: WorkoutViewModel())
    }
}

extension WorkoutCreateView{
    
    func makeTextField(_ label: String, text: Binding<String>) -> some View {
        VStack {
            TextField(label, text: text)
                .multilineTextAlignment(.center)
                .textFieldStyle(PlainTextFieldStyle())
            
            Divider()
                .frame(height: 1)
                .background(.red)
                
        }
        .padding(.horizontal, 32)
    }
    
    func makeTextEditor(_ label: String, text: Binding<String>) -> some View {
        VStack {
            Text(label)
                .foregroundColor(.gray.opacity(0.5))
            
            TextEditor(text: text)
                .frame(height: 150)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.red, lineWidth: 1)
                )
        }
        .padding(.horizontal, 32)
    }
}
