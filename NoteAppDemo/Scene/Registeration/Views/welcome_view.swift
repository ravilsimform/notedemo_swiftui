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
            VStack {
                titleOfApp
                Spacer().frame(height:100)
                loginButton
                signupButton
            }
        }
    }
    
    var titleOfApp: some View {
        Text("Welcome To\nNote").multilineTextAlignment(.center)
    }
    
    var loginButton: some View {
        NavigationLink(destination: login_view(),tag:1,selection: $tapOnButton) {
            CustomButton(button_text: "Login", action: {
                self.tapOnButton = 1
            }).buttonStyle(CustomButtonStyle(_width:UIScreen.main.bounds.width / 2))
        }
    }
    
    var signupButton: some View {
        NavigationLink(destination: login_view(),tag:1,selection: $tapOnButton) {
            CustomButton(button_text: "Signin", action: {
                self.tapOnButton = 2
            }).buttonStyle(CustomButtonStyle(_width:UIScreen.main.bounds.width / 2))
        }
    }
}

struct welcome_view_Previews: PreviewProvider {
    static var previews: some View {
        welcome_view()
    }
}
