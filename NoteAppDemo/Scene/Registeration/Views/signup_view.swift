//
//  signup_view.swift
//  NoteAppDemo
//
//  Created by Ravi Lakhtariya on 28/11/22.
//

import SwiftUI
import Combine
struct signup_view: View {
    
    @StateObject var viewModel: SignUpViewModel = SignUpViewModel()

    
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
        CustomTextField($viewModel.firstNameField,placeHolder: "FirstName",fieldType: .text,showFloatingLabel: false, editingChanged: { (isChanged) in
            
        })
    
    }
    
    var lnTextFied: some View {
        CustomTextField($viewModel.lastNameField,placeHolder: "LastName",fieldType: .text,showFloatingLabel: false, editingChanged: { (isChanged) in
            
        })    }
    
    var emailTextFied: some View {
        CustomTextField($viewModel.emailField,placeHolder: "Email",fieldType: .email,showFloatingLabel: false, editingChanged: { (isChanged) in
            
        })    }
    
    
    var passwordTextFied: some View {
        CustomTextField($viewModel.passwordField,isSecure: true,placeHolder: "Password",fieldType: .password,showFloatingLabel: false, editingChanged: { (isChanged) in
            
        })    }
    
    
    var confirmPasswordTextFied: some View {
        CustomTextField($viewModel.confirmPasswordField,isSecure: true,placeHolder: "Confirm Password",fieldType: .password,showFloatingLabel: false, editingChanged: { (isChanged) in
            
        })    }
    
    
    var signupButton: some View {
        HStack (spacing:100){
            CustomButton(button_text: "Forgot Password?",text_color: AppThemeColor.textColor, action: {})
            CustomButton(button_text: "Signup",text_color: AppThemeColor.whiteColor, action: {}).buttonStyle(CustomButtonStyle(_width:100,_backgroundColor:AppThemeColor.themeColor))
            
        }
        
    }
}
