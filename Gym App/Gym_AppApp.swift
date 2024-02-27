//
//  Gym_AppApp.swift
//  Gym App
//
//  Created by Theo Farris on 1/24/24.
//

import SwiftUI
import Firebase

@main
struct Gym_AppApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
