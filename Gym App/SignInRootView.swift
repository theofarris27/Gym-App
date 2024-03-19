//
//  SignInRootView.swift
//  Gym App
//
//  Created by Theo Farris on 3/13/24.
//

import SwiftUI

struct SignInRootView: View {
    
    @State var showSignInView: Bool = false
    @State var signIn: Bool = false
    @State var preSignIn: Bool
    
    var body: some View {
        ZStack {
            NavigationStack {
                VStack {
                    Text("signed in view")
                    Button {
                        SignInView(signedIn: $preSignIn)
                    } label: {
                        Text("Go back to sign in")
                    }
                    Button {
                        RegistrationActivityView(signInSuccess: $preSignIn)
                    } label: {
                        Text("Go back to resitration")
                    }
                }
            }
        }
        .onAppear  {
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            self.showSignInView = authUser == nil
        }
        
        .fullScreenCover(isPresented: $preSignIn) {
            NavigationStack{
                SignInView(signedIn: $preSignIn)
            }
        }
    }
}

