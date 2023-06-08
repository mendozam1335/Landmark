//
//  ProfileHost.swift
//  Landmark
//
//  Created by Mario Mendoza on 5/17/23.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
    @State var draftProfile = Profile.default
    
    
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20.0){
            HStack{
                if editMode?.wrappedValue == .active{
                    Button("Cancel", role: .cancel){
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                
                EditButton()
            }
            
            if editMode?.wrappedValue == .inactive{
                ProfileSummary(profile: modelData.profile)
            }
            else{
                ProfileEditor(profile: $draftProfile)
                    .onAppear{
                        draftProfile = modelData.profile
                    }
                    .onDisappear{
                        modelData.profile = draftProfile
                    }
            }
            
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
