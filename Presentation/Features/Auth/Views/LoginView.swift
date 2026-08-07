//
//  LoginView.swift
//  WhenWe
//
//  Created by Naila Amirova on 23.07.26.
//

import Foundation
import SwiftUI
import AuthenticationServices
import GoogleSignIn

struct LoginView: View {
    
    let onSignedIn: (Bool) -> Void
    @State private var viewModel = LoginViewModel()
    @Environment(AppRouter.self) private var router
    
    private var rootViewController: UIViewController? {
        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?
            .keyWindow?.rootViewController
    }
    
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
                    
                    
                    SignInWithAppleButton(.continue) { request in
                        request.requestedScopes = [.fullName, .email]
                    } onCompletion: { result in
                        switch result {
                        case .success(let authorization):
                            guard let credential = authorization.credential as? ASAuthorizationAppleIDCredential,
                                  let tokenData = credential.identityToken,
                                  let idToken = String(data: tokenData, encoding: .utf8) else { return }

                            var fullName: String?
                            if let components = credential.fullName {
                                let formatted = PersonNameComponentsFormatter().string(from: components)
                                fullName = formatted.isEmpty ? nil : formatted
                            }

                            Task {
                                if let authResult = await viewModel.signInWithApple(idToken: idToken, fullName: fullName) {
                                    onSignedIn(authResult.isNew)
                                }
                            }

                        case .failure(let error):
                            viewModel.error = error
                        }
                    }
                    .signInWithAppleButtonStyle(.white)
                    .frame(height: 56)
                    .clipShape(RoundedRectangle(cornerRadius: Radius.large))
                    
                    Button {
                        /*
                        Task {
                            guard let rootViewController else { return }

                            do {
                                let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)

                                guard let idToken = result.user.idToken?.tokenString else { return }

                                if let authResult = await viewModel.signInWithGoogle(
                                    idToken: idToken,
                                    fullName: result.user.profile?.name
                                ) {
                                    onSignedIn(authResult.isNew)
                                }
                            } catch {
                                viewModel.error = error
                            }
                        }
                         */
                        router.signedIn(isNew: true)
                    } label: {
                        HStack(alignment: .center,spacing: Spacing.sm) {
                            Image(AppIcons.google)
                                .resizable()
                                .frame(width: 16, height: 20)
                            
                            Text("Continue with Google")
                                .font(.system(size: 20, weight: .medium))
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
