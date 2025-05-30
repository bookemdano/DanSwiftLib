//
//  SignInWithAppleButtonView.swift
//  DanSwiftLib
//
//  Created by Daniel Francis on 4/4/25.
//

import SwiftUI
import AuthenticationServices
import DanSwiftLib

@available(iOS 14.0, *)
public struct SignInWithAppleButtonView: View {
    @Binding var welcomed: Bool
    public init (_ welcomed: Binding<Bool>) {
        self._welcomed = welcomed
    }
    
    public var body: some View {
        SignInWithAppleButton(
            .signIn,
            onRequest: configure,
            onCompletion: handle
        )
        .signInWithAppleButtonStyle(.black) // or .white, .whiteOutline
        .frame(height: 45)
        .padding()
    }

    private func configure(_ request: ASAuthorizationAppleIDRequest) {
        request.requestedScopes = [.fullName, .email]
    }

    private func handle(_ result: Result<ASAuthorization, Error>) {
        switch result {
        case .success(let auth):
            if let credential = auth.credential as? ASAuthorizationAppleIDCredential {
                print("User ID: \(credential.user)")
                print("Email: \(credential.email ?? "no email")")
                print("Full Name: \(credential.fullName?.givenName ?? "no name")")
                IOPAws.saveUserID(credential.user)
                welcomed = true
                // Save user ID securely (e.g., to Keychain)
            }
        case .failure(let error):
            print("Authorization failed: \(error)")
        }
    }
}
