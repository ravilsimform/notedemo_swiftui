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
    
    func passwordValidator() -> String {
        if($passwordTxtField.wrappedValue.isEmpty) {
             return "Please enter word";
        } else if($passwordTxtField.wrappedValue.count > 3) {
            return "Please add more word";
        }
        return ""
     }
     
    
    
    var body: some View {
        VStack{
            titleOfLoginScreen
            CustomTextField(placeHolder: "Email", text: $emailTxtField, errorText:emailValidator(),height: 40)
            CustomTextField(placeHolder: "Password", text: $passwordTxtField,errorText: passwordValidator(),width: UIScreen.main.bounds.width/3,height: 40)
            CustomButton(button_text: "Login", action: {}).buttonStyle(CustomButtonStyle(_width:100,_backgroundColor:Color.blue))
        }
    }
    
    var titleOfLoginScreen: some View {
        Text("LOGIN").multilineTextAlignment(.center)
    }
    
}

struct login_view_Previews: PreviewProvider {
    static var previews: some View {
        login_view()
    }
}
