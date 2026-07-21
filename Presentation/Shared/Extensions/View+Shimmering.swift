//
//  View+Shimmering.swift
//  WhenWe
//
//  Created by Naila Amirova on 20.07.26.
//

import SwiftUI

extension View {

    func shimmering() -> some View {
        modifier(ShimmerModifier())
    }
}
