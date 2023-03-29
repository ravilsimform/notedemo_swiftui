//
//  app_info.swift
//  NoteAppDemo
//
//  Created by Ravi Lakhtariya on 29/03/23.
//

import Foundation

class AppInfo {
    
    static func getBundleId() -> String {
        return Bundle.main.bundleIdentifier ?? ""    }
}
