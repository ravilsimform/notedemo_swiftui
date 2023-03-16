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
            TextField("Email", text: $emailTxtField).textFieldStyle(CustomTextField())
            TextField("Password", text: $passwordTxtField).textFieldStyle(CustomTextField())
            CustomButton(button_text: "Login", action: {})
        }
    }
}

struct login_view_Previews: PreviewProvider {
    static var previews: some View {
        login_view()
    }
}
