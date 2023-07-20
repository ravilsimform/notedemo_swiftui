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
    
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        if #available(iOS 16.0, *) {
            ZStack {
                List {
                    titleOfSignupScreen
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    Spacer().frame(height:80)
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    fnTextFied
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    lnTextFied
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    emailTextFied
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    passwordTextFied
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    confirmPasswordTextFied
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    signupButton
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                }
                .padding(EdgeInsets())
                .scrollContentBackground(.hidden)
                .scrollIndicators(.hidden)
            } .background(
                Image("registration_bgview")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            ).navigationBarBackButtonHidden(true)
            
        } else {
            // Fallback on earlier versions
        }
    }
    
    
    var titleOfSignupScreen: some View {
        Text("SIGNUP")
            .fontWeight(.bold)
            .multilineTextAlignment(.leading)
            .foregroundColor(AppThemeColor.textColor)
            .font(.title)
    }
    
    var fnTextFied: some View {
        CustomTextField(placeHolder: "First Name", text: $firstNameTextField, errorText:viewModel.textFieldValidator(textField: $firstNameTextField.wrappedValue),height: 40).textFieldStyle(CustomTextFieldStyle(_borderColor:AppThemeColor.themeColor))
        
    }
    
    var lnTextFied: some View {
        CustomTextField(placeHolder: "Last Name", text: $lastNameTextField, errorText:viewModel.textFieldValidator(textField: $lastNameTextField.wrappedValue),height: 40).textFieldStyle(CustomTextFieldStyle(_borderColor:AppThemeColor.themeColor))
        
    }
    
    var emailTextFied: some View {
        CustomTextField(placeHolder: "Email", text: $emailTxtField, errorText:viewModel.emailValidator(emailTextField: $emailTxtField.wrappedValue),height: 40).textFieldStyle(CustomTextFieldStyle(_borderColor:AppThemeColor.themeColor))
        
    }
    
    var passwordTextFied: some View {
        CustomTextField(placeHolder: "Password", text: $passwordTxtField,errorText: viewModel.passwordValidator(passwordTextField: $passwordTxtField.wrappedValue),width: UIScreen.main.bounds.width/3,height: 40).textFieldStyle(CustomTextFieldStyle(_borderColor:AppThemeColor.themeColor))
    }
    
    var confirmPasswordTextFied: some View {
        CustomTextField(placeHolder: "Confirm Password", text: $confPasswordTxtField, errorText:viewModel.passwordValidator(passwordTextField: $passwordTxtField.wrappedValue),width: UIScreen.main.bounds.width/3,height: 40).textFieldStyle(CustomTextFieldStyle(_borderColor:AppThemeColor.themeColor))
    }
    
    var signupButton: some View {
        HStack (spacing:100){
            CustomButton(button_text: "Forgot Password?",text_color: AppThemeColor.textColor, action: {})
            CustomButton(button_text: "Signup",text_color: AppThemeColor.whiteColor, action: {}).buttonStyle(CustomButtonStyle(_width:100,_backgroundColor:AppThemeColor.themeColor))
            
        }
        
    }
}
