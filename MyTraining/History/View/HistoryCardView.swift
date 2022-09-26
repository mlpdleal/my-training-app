//
//  HistoryCardView.swift
//  MyTraining
//
//  Created by Manoel Leal on 25/09/22.
//

import SwiftUI

struct HistoryCardView: View {
    
    let viewModel: HistoryCardViewModel
    
    var body: some View {
        ZStack(alignment: .trailing){
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
                        
                        Text("Total time: \(viewModel.time)")
                            .multilineTextAlignment(.leading)
                            .font(.callout)
                            .opacity(0.8)
                            .padding(.bottom, 2)
                            
                        
                    }
                    Spacer()
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
