//
//  welcome_view.swift
//  NoteAppDemo
//
//  Created by Ravi Lakhtariya on 29/11/22.
//

import SwiftUI

struct welcome_view: View {
    @State var tapOnButton: Int? = nil
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    titleOfApp
                    Spacer().frame(height:100)
                    loginButton
                    signupButton
                }
            }.background(
                Image("registration_bgview")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            )
        }
    }
    
    var titleOfApp: some View {
        Text("Go Green Note")
            .fontWeight(.bold)
            .multilineTextAlignment(.leading)
            .foregroundColor(AppThemeColor.textColor)
            .font(.title)
    }
    
    var loginButton: some View {
        NavigationLink(destination: login_view(),tag:1,selection: $tapOnButton) {
            CustomButton(button_text: "Login", action: {
                self.tapOnButton = 1
            }).buttonStyle(CustomButtonStyle(_width:UIScreen.main.bounds.width / 2,_borderWidth:1.0,_borderColor: AppThemeColor.textColor))
        }
    }
    
    var signupButton: some View {
        NavigationLink(destination: signup_view(),tag:2,selection: $tapOnButton) {
            CustomButton(button_text: "SignUp", action: {
                self.tapOnButton = 2
            }).buttonStyle(CustomButtonStyle(_width:UIScreen.main.bounds.width / 2,_borderWidth:1.0, _borderColor: AppThemeColor.textColor))
        }
    }
}

struct welcome_view_Previews: PreviewProvider {
    static var previews: some View {
        welcome_view()
    }
}
