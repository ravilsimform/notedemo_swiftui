//
//  login_view.swift
//  NoteAppDemo
//
//  Created by Ravi Lakhtariya on 28/11/22.
//

import SwiftUI

struct login_view: View {
    @State private var emailTxtField: String = ""
    @State private var passwordTxtField: String = ""
    var body: some View {
        VStack{
            CustomTextField(placeHolder: "Email", text: $emailTxtField).textFieldStyle(CustomTextFieldStyle(foregroundColor:Color.red))
            CustomTextField(placeHolder: "Password", text: $passwordTxtField)
            CustomButton(button_text: "Login", action: {})
        }
    }
}

struct login_view_Previews: PreviewProvider {
    static var previews: some View {
        login_view()
    }
}
