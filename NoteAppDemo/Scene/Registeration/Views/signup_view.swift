//
//  signup_view.swift
//  NoteAppDemo
//
//  Created by Ravi Lakhtariya on 28/11/22.
//

import SwiftUI

struct signup_view: View {
    @State private var firstNameTextField: String = ""
    @State private var lastNameTextField: String = ""
    @State private var emailTxtField: String = ""
    @State private var passwordTxtField: String = ""
    @State private var confPasswordTxtField: String = ""
    var body: some View {
        VStack{
            TextField("First Name", text: $firstNameTextField).textFieldStyle(CustomTextField())
            TextField("Last Name", text: $lastNameTextField).textFieldStyle(CustomTextField())
            TextField("Password", text: $passwordTxtField).textFieldStyle(CustomTextField())
            TextField("Confirm Password", text: $passwordTxtField).textFieldStyle(CustomTextField())
            CustomButton(button_text: "Signup", action:  {})
        }
    }
}

struct signup_view_Previews: PreviewProvider {
    static var previews: some View {
        signup_view()
    }
}
