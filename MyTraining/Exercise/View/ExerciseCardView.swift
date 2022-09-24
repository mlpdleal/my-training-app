//
//  ExerciseCardView.swift
//  MyTraining
//
//  Created by Manoel Leal on 24/09/22.
//

import SwiftUI

struct ExerciseCardView: View {
    
    @Binding var id: UUID
    @Binding var photo: Data?
    @Binding var name: String
    
    @ObservedObject var viewModel: ExerciseViewModel

    var body: some View {
        
        ZStack(alignment: .trailing){
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
                        
                        
                    }
                    Spacer()
                    HStack(alignment: .center){
                        
                        Button{
                            viewModel.deleteExercise(id: id)
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
        .background(
            RoundedRectangle(cornerRadius: 4.0)
                .stroke(Color.red.opacity(0.5), lineWidth: 1.4)
        )
        .padding(.horizontal, 4)
        .padding(.vertical, 4)
    }
}

struct ExerciseCardView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseCardView(id: .constant(UUID()), photo: .constant(nil), name: .constant("Pull Up"), viewModel: ExerciseViewModel())
    }
}
