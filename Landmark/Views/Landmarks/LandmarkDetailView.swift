//
//  LandmarkDetailView.swift
//  Landmark
//
//  Created by Mario Mendoza on 5/13/23.
//

import SwiftUI

struct LandmarkDetailView: View {
    @EnvironmentObject var modeldata: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int{
        modeldata.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinates)
                .frame(height: 300)
                .ignoresSafeArea(edges: .top)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modeldata.landmarks[landmarkIndex].isFavorite)
                }
        
                HStack {
                    Text(landmark.park)
                        
                    Spacer()
                    
                    Text(landmark.state)
                        
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                
                Text(landmark.description)
                    .font(.subheadline)
            }
            .padding()
            
            
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetailView_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        LandmarkDetailView(landmark: ModelData().landmarks[0])
            .environmentObject(modelData)
    }
}
