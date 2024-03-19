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
                    NavigationLink(destination: SignInView(signedIn: $preSignIn)){
                        Text("Go Back to Sign In")
                    }
                    NavigationLink(destination: RegistrationActivityView(signInSuccess: $preSignIn)){
                        Text("Go Back to Registration")
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

