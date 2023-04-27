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
    @ObservedObject var viewModel: SignUpViewModel = SignUpViewModel()
    
    var body: some View {
        ZStack {
            VStack {
               titleOfSignupScreen
                Spacer().frame(height:100)
                fnTextFied
                lnTextFied
                emailTextFied
                passwordTextFied
                confirmPasswordTextFied
                signupButton
            }
        } .background(
            Image("registration_bgview")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        )
    }
    
    
    var titleOfSignupScreen: some View {
        Text("SIGNUP").multilineTextAlignment(.center)
    }
    
    var fnTextFied: some View {
        CustomTextField(placeHolder: "First Name", text: $emailTxtField, errorText:viewModel.emailValidator(emailTextField: $emailTxtField.wrappedValue),height: 40)
    
    }
    var lnTextFied: some View {
        CustomTextField(placeHolder: "Last Name", text: $emailTxtField, errorText:viewModel.emailValidator(emailTextField: $emailTxtField.wrappedValue),height: 40)
    
    }
    var emailTextFied: some View {
        CustomTextField(placeHolder: "Email", text: $emailTxtField, errorText:viewModel.emailValidator(emailTextField: $emailTxtField.wrappedValue),height: 40)
    
    }
    
    var passwordTextFied: some View {
        CustomTextField(placeHolder: "Password", text: $passwordTxtField,errorText: viewModel.passwordValidator(passwordTextField: $passwordTxtField.wrappedValue),width: UIScreen.main.bounds.width/3,height: 40)
    }
    
    var confirmPasswordTextFied: some View {
        CustomTextField(placeHolder: "Confirm Password", text: $emailTxtField, errorText:viewModel.emailValidator(emailTextField: $emailTxtField.wrappedValue),height: 40)
    
    }
    
    var signupButton: some View {
        CustomButton(button_text: "Signup", action: {}).buttonStyle(CustomButtonStyle(_width:100))
    }
}
