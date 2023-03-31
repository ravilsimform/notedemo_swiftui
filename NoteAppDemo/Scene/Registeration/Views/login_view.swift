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
            CustomTextField(placeHolder: "Email", text: $emailTxtField, errorText:emailValidator(),width:UIScreen.main.bounds.width - 200,height: 40)
            //CustomTextField(placeHolder: "Password", text: $passwordTxtField,)
            CustomButton(button_text: "Login", action: {}).buttonStyle(CustomButtonStyle(_width:100,_backgroundColor:Color.blue))
        }
    }
}

struct login_view_Previews: PreviewProvider {
    static var previews: some View {
        login_view()
    }
}
