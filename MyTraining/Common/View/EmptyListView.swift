//
//  EmptyView.swift
//  MyTraining
//
//  Created by Manoel Leal on 25/09/22.
//

import SwiftUI

struct EmptyListView: View {
    var body: some View {
        VStack(alignment: .center){
            
            Group{
                Spacer()
                Image(systemName: "exclamationmark.triangle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .padding(.bottom, 5)
                
                Text("No items")
                    .bold()
                
                Spacer()
            }
            .foregroundColor(.yellow)
            
            
        }
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView()
    }
}
