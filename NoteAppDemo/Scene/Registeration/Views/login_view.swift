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
    @ObservedObject var viewModel: SignUpViewModel = SignUpViewModel()
 
    var body: some View {
        ZStack{
            VStack{
                titleOfLoginScreen
                Spacer().frame(height:100)
                emailTextFied
                passwordTextFied
                loginButton
            }
        } .background(
            Image("registration_bgview")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        )
        
    }
    
    var titleOfLoginScreen: some View {
        Text("LOGIN").multilineTextAlignment(.center)
    }
    
    var emailTextFied: some View {
        CustomTextField(placeHolder: "Email", text: $emailTxtField, errorText:viewModel.emailValidator(emailTextField: $emailTxtField.wrappedValue),height: 40)
    
    }
    
    var passwordTextFied: some View {
        CustomTextField(placeHolder: "Password", text: $passwordTxtField,errorText: viewModel.passwordValidator(passwordTextField: $passwordTxtField.wrappedValue),width: UIScreen.main.bounds.width/3,height: 40)
    }
    
    var loginButton: some View {
        CustomButton(button_text: "Login", action: {}).buttonStyle(CustomButtonStyle(_width:100,_backgroundColor:Color.blue))
    }
}
