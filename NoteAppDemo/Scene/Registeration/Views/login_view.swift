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
    
   func emailValidator() -> String {
       if($emailTxtField.wrappedValue.isEmpty) {
            return "Please enter word";
       } else if($emailTxtField.wrappedValue.count > 3) {
           return "Please add more word";
       }
       return ""
    }
    
    
    
    var body: some View {
        VStack{
            CustomTextField(placeHolder: "Email", text: $emailTxtField, errorText:emailValidator() ).textFieldStyle(CustomTextFieldStyle(foregroundColor:Color.red))
            //CustomTextField(placeHolder: "Password", text: $passwordTxtField,)
            CustomButton(button_text: "Login", action: {})
        }
    }
}

struct login_view_Previews: PreviewProvider {
    static var previews: some View {
        login_view()
    }
}
