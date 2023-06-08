//
//  LandmarksList.swift
//  Landmark
//
//  Created by Mario Mendoza on 5/13/23.
//

import SwiftUI

struct LandmarksList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var body: some View {
        
        
        var filteredLandmarks: [Landmark]{
            modelData.landmarks.filter{ Landmark in
                (!showFavoritesOnly || Landmark.isFavorite)
                
            }
        }
        
        NavigationView {
            List{
                
                Toggle(isOn: $showFavoritesOnly){
                    Text("Favorites Only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetailView(landmark: landmark)
                    }label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
        
    }
}

struct LandmarksList_Previews: PreviewProvider {
    static var previews: some View {
        //        ForEach(["iPhone SE (3rd generation)", "iPhone Xs Max","iPhone 14 Pro"], id: \.self) {deviceName in
        //            LandmarksList()
        //                .previewDevice(PreviewDevice(rawValue: deviceName))
        //                .previewDisplayName(deviceName)
    //}
        LandmarksList()
            .environmentObject(ModelData())
        
        
    }
}
