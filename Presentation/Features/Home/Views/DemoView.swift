//
//  DemoView.swift
//  WhenWe
//
//  Created by Naila Amirova on 11.08.26.
//

import SwiftUI

struct DemoView : View {
    var body: some View {
        
        VStack {
            Spacer()
            
            VStack(alignment: .leading,spacing: Spacing.sm ) {
                Text("Title")
                
                Text("Subtitle")
                
                Text("Description")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            Spacer(minLength: 500)
        }
    }
}

#Preview {
    DemoView()
}
