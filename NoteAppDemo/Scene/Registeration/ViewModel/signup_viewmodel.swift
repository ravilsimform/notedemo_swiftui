//
//  signup_viewmodel.swift
//  NoteAppDemo
//
//  Created by Ravi Lakhtariya on 21/03/23.
//


import SwiftUI
import Combine

class SignUpViewModel: ObservableObject {

    func emailValidator(emailTextField: String) -> String {
        if(emailTextField.isEmpty) {
             return "Please enter email";
        }
        return ""
     }
     
     func passwordValidator(passwordTextField: String) -> String {
         if(passwordTextField.isEmpty) {
              return "Please enter password";
         } else if(passwordTextField.count < 6) {
             return "Please enter 6 character password";
         }
         return ""
      }
    
}
