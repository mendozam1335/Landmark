//
//  LandmarkApp.swift
//  Landmark
//
//  Created by Mario Mendoza on 5/12/23.
//

import SwiftUI

@main
struct LandmarkApp: App {
    
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
