//
//  ContentView.swift
//  Gym App
//
//  Created by Theo Farris on 1/24/24.
//

import SwiftUI

struct ContentView: View {
    @State private var shouldShowMenu = true
    @State private var selectedTab: Tab = .camera
    @State var name: String = ""
    @State var password: String = ""
    @State var showPassword: Bool = false
    
    var isSignInButtonDisabled: Bool {
          [name, password].contains(where: \.isEmpty)
      }
      

    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack{
            VStack{
                TabView(selection: $selectedTab) {
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        VStack{
                            if(tab.rawValue == "leaf") {
                                Spacer()
                                           
                                           TextField("Name",
                                                     text: $name ,
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
                                                   if showPassword {
                                                       TextField("Password", // how to create a secure text field
                                                                   text: $password,
                                                                   prompt: Text("Password").foregroundColor(.red)) // How to change the color of the TextField Placeholder
                                                   } else {
                                                       SecureField("Password", // how to create a secure text field
                                                                   text: $password,
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
Spacer()
                                           Button {
                                               print("do login action")
                                               
                                           } label: {
                                               Text("Sign In")
                                                   .font(.title2)
                                                   .bold()
                                                   .foregroundColor(.white)
                                           }
                                           .frame(height: 50)
                                           .frame(maxWidth: .infinity) // how to make a button fill all the space available horizontaly
                                           .background(
                                               isSignInButtonDisabled ? // how to add a gradient to a button in SwiftUI if the button is disabled
                                               LinearGradient(colors: [.gray], startPoint: .topLeading, endPoint: .bottomTrailing) :
                                                   LinearGradient(colors: [.blue, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
                                           )
                                           .cornerRadius(15)
                                           .disabled(isSignInButtonDisabled) // how to disable while some condition is applied
                                           .padding()
                                Spacer()
                            }
                            else if(tab.rawValue == "camera"){
                                    Image(systemName: tab.rawValue)
                                    Text("\(tab.rawValue.capitalized)")
                                        .bold()
                                        .animation(nil, value: selectedTab)
                                }
                            else {
                                    Text("login")
                                .position(CGPoint(x: 10.0, y: 10.0))
                                }
                        }.tag(tab)
                    }
                }
            }
                VStack {
                    Spacer()
                    navigationBarTest(selectedTab: $selectedTab)
                }
                
            }
        }
    }
    
    
    
    
    private let menuItems = ContextMenu {
        Button {
            // Add this item to a list of favorites.
        } label: {
            Label("Click to sign in", systemImage: "heart")
        }
        Button {
            // Open Maps and center it on this item.
        } label: {
            Label("Click to sign out", systemImage: "house.fill")
        }
    }
    
    #Preview {
        ContentView()
    }

