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
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        if #available(iOS 16.0, *) {
            ZStack{
                List{
                    titleOfLoginScreen
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    Spacer().frame(height:20)
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    emailTextFied
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    passwordTextFied
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    loginButton
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
        } else {}
    }
    
    var titleOfLoginScreen: some View {
        Text("LOGIN")
            .fontWeight(.bold)
            .multilineTextAlignment(.leading)
            .foregroundColor(AppThemeColor.textColor)
            .font(.title)
    }
    
    var emailTextFied: some View {
        CustomTextField(placeHolder: "Email", text: $emailTxtField, errorText:viewModel.textFieldValidator(textField: $emailTxtField.wrappedValue),height: 40).textFieldStyle(CustomTextFieldStyle(_borderColor:AppThemeColor.themeColor))
    }
    
    var passwordTextFied: some View {
        CustomTextField(placeHolder: "Password", text: $passwordTxtField,errorText: viewModel.textFieldValidator(textField: $passwordTxtField.wrappedValue),width: UIScreen.main.bounds.width/3,height: 40).textFieldStyle(CustomTextFieldStyle(_borderColor:AppThemeColor.themeColor))
    }
    
    var loginButton: some View {
        CustomButton(button_text: "Login",text_color: AppThemeColor.whiteColor, action: {}).buttonStyle(CustomButtonStyle(_width:100,_backgroundColor:AppThemeColor.themeColor))
    }
}
