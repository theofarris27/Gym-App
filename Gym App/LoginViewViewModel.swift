//
//  LoginViewViewModel.swift
//  Gym App
//
//  Created by Luc Rathbun on 2/27/24.
//

import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    @State var signInSuccess: Bool?
    
    init () {}
    
    func createUser() {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields"
            return
        }
        
        Task {
            do {
                let returnedUserData = try await AuthenticationManager.shared.createUser(email: email, password: password)
                print("logged in")
                print(returnedUserData)
            } catch {
            }
        }
      
    }
    
    func login() {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields"
            return
        }
        Task {
            do {
                let returnedUserData = try? AuthenticationManager.shared.getAuthenticatedUser()
                if(returnedUserData != nil){
                    signInSuccess = true
                    SignInRootView(preSignIn: signInSuccess)
                }
                else{
                    signInSuccess = false
                    SignInRootView(preSignIn: signInSuccess)
                }
            }
            catch{
                
            }
        }
    }
}
