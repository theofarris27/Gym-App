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
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack{
            VStack{
                TabView(selection: $selectedTab) {
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        HStack{
                            Image(systemName: tab.rawValue)
                            Text("\(tab.rawValue.capitalized)")
                                .bold()
                                .animation(nil, value: selectedTab)
                        }.tag(tab)
                    }
                }
            }
            VStack {
                Spacer()
                navigationBarTest(selectedTab: $selectedTab)
            }
        }
        
//        VStack {
//           
//            Button {
//                
//            } label: {
//                Text("please work")
//                    .multilineTextAlignment(.trailing)
//                    .lineLimit(nil)
//                    .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
//                    .contextMenu(shouldShowMenu ? menuItems : nil)
//                    .position(CGPoint(x: 300.0, y: 10.0))
//            }
//        }
//        .contextMenu(ContextMenu(menuItems: {
//            Text("Sign In")
//            Text("Sign out")
//            Text("Tracker")
//        }))
        .padding()
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
