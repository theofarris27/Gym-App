//
//  ContentView.swift
//  Gym App
//
//  Created by Theo Farris on 1/24/24.
//

import SwiftUI

struct ContentView: View {
    @State private var shouldShowMenu = true
    var body: some View {
        VStack {
            Image("hyunjun")
                .resizable()
                .cornerRadius(3)
                .aspectRatio(contentMode:
                        .fit)
            Button {
                print("HOW TO SWIFT CODE")
            } label: {
                Image("jaykim")
                    .resizable()
                    .aspectRatio(contentMode:
                            .fit)
            }
            Text("making some progress idk")
        }
       
        .padding()
    }
}


#Preview {
    ContentView()
}
