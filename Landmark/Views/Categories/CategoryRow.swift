//
//  CategoryRow.swift
//  Landmark
//
//  Created by Mario Mendoza on 5/16/23.
//

import SwiftUI

struct CategoryRow: View {
    var catagoryName: String
    var items: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(catagoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0){
                    ForEach(items) { landmark in
                        NavigationLink{
                            LandmarkDetailView(landmark: landmark)
                        } label: {
                            CategoryItem(landmark: landmark)
                        }
                        
                    }
                }
            }
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var landmaks = ModelData().landmarks
    
    static var previews: some View {
        CategoryRow(
            catagoryName: landmaks[0].category.rawValue,
            items: Array(landmaks.prefix(4))
        )
    }
}
