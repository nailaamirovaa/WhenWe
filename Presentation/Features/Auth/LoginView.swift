//
//  LoginView.swift
//  WhenWe
//
//  Created by Naila Amirova on 23.07.26.
//

import Foundation
import SwiftUI

struct LoginView: View {
    
    var body: some View {
        
        ZStack{
            
            VStack{
                
                Spacer()
                
                VStack(alignment: .center, spacing: Spacing.xs) {
                    Image(AppIcons.progress_ring)
                        .resizable()
                        .frame(width: 88, height: 88)
                        .cornerRadius(26)
                    
                    Text("WhenWe")
                        .font(AppFont.display)
                        .foregroundStyle(.white)
                    
                    Text("Stop the group-chat chaos.\nOne tap and everyone's in.")
                        .font(AppFont.body)
                        .foregroundStyle(.white).opacity(0.9)
                        .multilineTextAlignment(.center)
                }
                
                Spacer()
                
                
                VStack(spacing: Spacing.xs) {
                    Button {
                        
                    }label: {
                        HStack(alignment: .center,spacing: Spacing.sm) {
                            Image(AppIcons.apple)
                                .resizable()
                                .frame(width: 18, height: 18)
                            
                            Text("Continue with Apple")
                                .font(AppFont.bodyStrong)
                                .foregroundStyle(.black )
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(.white)
                        .clipShape(
                            RoundedRectangle(cornerRadius: Radius.large)
                        )
                    }
                    
                    Button {
                        
                    }label: {
                        HStack(alignment: .center,spacing: Spacing.sm) {
                            Image(AppIcons.google)
                                .resizable()
                                .frame(width: 28, height: 24)
                            
                            Text("Continue with Google")
                                .font(AppFont.bodyStrong)
                                .foregroundStyle(.white )
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(.black)
                        .clipShape(
                            RoundedRectangle(cornerRadius: Radius.large)
                        )
                    }
                    
                    Text("By continuing you agree to our\nTerms & Privacy Policy")
                        .font(AppFont.label)
                        .foregroundStyle(.white).opacity(0.8)
                        .multilineTextAlignment(.center)
                }
            }
            .padding(Spacing.screenPadding)
        }
        .background(.brandPrimary)
    }
}
