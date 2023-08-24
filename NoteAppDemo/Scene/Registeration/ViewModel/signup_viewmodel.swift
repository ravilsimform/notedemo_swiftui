//
//  signup_viewmodel.swift
//  NoteAppDemo
//
//  Created by Ravi Lakhtariya on 21/03/23.
//


import SwiftUI
import Combine

class SignUpViewModel: ObservableObject {
    
    @Published var firstNameField: String = ""
    @Published var lastNameField: String = ""
    @Published var emailField: String = ""
    @Published var passwordField: String = ""
    @Published var confirmPasswordField: String = ""
    @FocusState var isFocused: Bool
    init() {}
    
    
}
