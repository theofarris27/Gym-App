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
    @State private var showPassword: Bool = false
    @Binding var signInSuccess: Bool
    @State private var showError = false
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        VStack{
            TextField("Name",
                      text: $viewModel.email ,
                      prompt: Text("Login").foregroundColor(.blue)
            )
            .padding(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.blue, lineWidth: 2)
            }
            
            .padding(15)
            
            HStack {
                Group {
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    if showPassword {
                        TextField("Password", // how to create a secure text field
                                  text: $viewModel.password,
                                  prompt: Text("Password").foregroundColor(.red)) // How to change the color of the TextField Placeholder
                    } else {
                        SecureField("Password", // how to create a secure text field
                                    text: $viewModel.password,
                                    prompt: Text("Password").foregroundColor(.red)) // How to change the color of the TextField Placeholder
                    }
                }
                .padding(8)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.red, lineWidth: 2) // How to add rounded corner to a TextField and change it colour
                }
                
                Button {
                    showPassword.toggle()
                } label: {
                    Image(systemName: showPassword ? "eye.slash" : "eye")
                        .foregroundColor(.red) // how to change image based in a State variable
                }
                
            }.padding(.horizontal)
            
            
            
            
            Button {
                viewModel.createUser()
                
            } label: {
                Text("Sign In")
                    .font(.title2)
                    .bold()
            }
            .frame(height: 50)
            .frame(maxWidth: .infinity) // how to make a button fill all the space available horizontaly
            .cornerRadius(15)
            .padding()
            Spacer()
        }
    }
}
