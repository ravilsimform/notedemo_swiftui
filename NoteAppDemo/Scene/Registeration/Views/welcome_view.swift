//
//  welcome_view.swift
//  NoteAppDemo
//
//  Created by Ravi Lakhtariya on 29/11/22.
//

import SwiftUI

struct welcome_view: View {
    
    var body: some View {
        VStack (){
            Label("Welcome To\nNote", image:"")
                .labelStyle(CustomLabelStyle(labelColor: Color.black))
            Spacer().frame(height:100)
            CustomButton(button_text: "Login",button_left_image: "star.fill", action: {})
            CustomButton(button_text: "Signup", action:  {})
        }
    }
}

struct welcome_view_Previews: PreviewProvider {
    static var previews: some View {
        welcome_view()
    }
}
