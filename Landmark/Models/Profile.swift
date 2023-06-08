//
//  Profile.swift
//  Landmark
//
//  Created by Mario Mendoza on 5/17/23.
//

import Foundation

struct Profile{
    var username: String
    var preferNotifications = true
    var goalDate = Date()
    var seasonalPhoto = Season.spring
    
    static let `default` = Profile(username: "g_kumar")
    
    enum Season: String, CaseIterable, Identifiable{
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        var id: String{ rawValue}

    }
}
