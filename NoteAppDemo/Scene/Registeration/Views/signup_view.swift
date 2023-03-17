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
//            CustomTextField(placeHolder: "First Name", text: $emailTxtField)
//            CustomTextField(placeHolder: "Last Name", text: $passwordTxtField)
//            CustomTextField(placeHolder: "Email", text: $emailTxtField)
//            CustomTextField(placeHolder: "Password", text: $emailTxtField)
//            CustomTextField(placeHolder: "Confirm Password", text: $passwordTxtField)

            CustomButton(button_text: "Signup", action:  {})
        }
    }
}

struct signup_view_Previews: PreviewProvider {
    static var previews: some View {
        signup_view()
    }
}
