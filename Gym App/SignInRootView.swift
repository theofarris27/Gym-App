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
    
    var body: some View {
        ZStack {
            NavigationStack {
                 Text("signed in view")
            }
        }
        .onAppear  {
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            self.showSignInView = authUser == nil
        }
        
        .fullScreenCover(isPresented: $showSignInView) {
            NavigationStack{
                SignInView(signedIn: $signIn)
            }
        }
    }
}

#Preview {
    SignInRootView()
}
