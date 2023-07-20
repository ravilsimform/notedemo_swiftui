//
//  NoteAppDemoApp.swift
//  NoteAppDemo
//
//  Created by Ravi Lakhtariya on 28/11/22.
//

import SwiftUI
import Firebase
@main
struct NoteAppDemoApp: App {
    
    init() {
       FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            welcome_view()
        }
    }
}
