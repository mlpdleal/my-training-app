//
//  ButtonStyle.swift
//  MyTraining
//
//  Created by Manoel Leal on 22/09/22.
//

import SwiftUI

struct ButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .padding(.horizontal, 16)
            .font(.title3.bold())
            .background(.red)
            .foregroundColor(.white)
            .cornerRadius(4.0)
    }
}

