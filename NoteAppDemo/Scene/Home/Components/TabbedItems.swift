//
//  TabbedItems.swift
//  NoteAppDemo
//
//  Created by Ravi Lakhtariya on 22/08/23.
//

import Foundation
enum TabbedItems: Int, CaseIterable{
    case home = 0
    case favorite
    case chat
    case profile
    
    var title: String{
        switch self {
        case .home:
            return "Home"
        case .favorite:
            return "Favorite"
        case .chat:
            return "Chat"
        case .profile:
            return "Profile"
        }
    }
    
    var iconName: String{
        switch self {
        case .home:
            return "house"
        case .favorite:
            return "heart"
        case .chat:
            return "menucard"
        case .profile:
            return "plus"
        }
    }
}
