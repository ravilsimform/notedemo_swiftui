//
//  signup_viewmodel.swift
//  NoteAppDemo
//
//  Created by Ravi Lakhtariya on 21/03/23.
//


import SwiftUI
import Combine

class SignUpViewModel: ObservableObject {
    
    func emailValidator(emailTextField: String) -> String? {
        if(textFieldValidator(textField: emailTextField) != nil) {
            
        }
        return textFieldValidator(textField: emailTextField)
    }
    
    func passwordValidator(passwordTextField: String) -> String? {
        if(textFieldValidator(textField: passwordTextField) != nil) {
            if(passwordTextField.count < 6) {
                return "Please enter 6 character password";
            }
        }
        return textFieldValidator(textField: passwordTextField)
    }
    
    
    func textFieldValidator(textField:String) -> String? {
        if (textField.isEmpty) {
            return "Please enter value";
        }
        return nil
    }
}
