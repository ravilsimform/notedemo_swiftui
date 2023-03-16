//
//  custom_textfield.swift
//  NoteAppDemo
//
//  Created by Ravi Lakhtariya on 16/03/23.
//

import Foundation
import SwiftUI

enum customTextFieldStyle {
    case icon, text, icontext
}
struct CustomTextField: TextFieldStyle {
    
    var icon: Image? = nil
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        textFieldConntentView(configuration: configuration)
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .stroke(Color(UIColor.systemGray4), lineWidth: 2)
            }
    }
    
    
    func textFieldConntentView(configuration: TextField<Self._Label>) -> AnyView {
        if(icon != nil) {
            return  AnyView( HStack {
                icon
                    .foregroundColor(Color(UIColor.systemGray4))
                
                configuration
            })
        }
        return AnyView(configuration)
    }
}

