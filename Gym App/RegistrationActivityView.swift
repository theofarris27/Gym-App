//
//  RegistrationActivityView.swift
//  Gym App
//
//  Created by Theo Farris on 2/21/24.
//

import SwiftUI

struct RegistrationActivityView: View {
    
    @State private var userName: String = ""
       @State private var password: String = ""
    @Binding var signInSuccess: Bool
       @State private var showError = false
    
    var body: some View {
        VStack {
                   HStack {
                       Text("Username")
                       TextField("Type Here", text: $userName)
                           .autocapitalization(.none)
                           .autocorrectionDisabled()
                   }.padding()
                   
                   HStack {
                       Text(" Password")
                       TextField("Type Here", text: $password)
                           .textContentType(.password)
                           .autocapitalization(.none)
                           .autocorrectionDisabled()
                   }.padding()
                   
                   Button(action: {
                       // Your auth logic
                       if(self.userName == self.password) {
                           self.signInSuccess = true
                       }
                       else {
                           self.showError = true
                       }
                       
                   }) {
                       Text("Create Account")
                   }
                   
                   if showError {
                       Text("Incorrect username/password").foregroundColor(Color.red)
                   }
               }
    }
}
