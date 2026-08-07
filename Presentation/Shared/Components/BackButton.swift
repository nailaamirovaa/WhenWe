//
//  BackButton.swift
//  WhenWe
//
//  Created by Naila Amirova on 07.08.26.
//

import SwiftUI
import Foundation

struct BackButton: View {
    
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            
            Image(systemName: "chevron.backward")
                .padding()
                .tint(.black)
                .background(.white)
                .clipShape(
                    Circle()
                )
                .frame(width: 40, height: 40)
        }
    }
}
