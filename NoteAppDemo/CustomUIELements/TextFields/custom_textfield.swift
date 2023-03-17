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

struct CustomTextField: View {
    
    var width: Double?
    var height: Double?
    var validator: (() -> Void)?

    private let placeHolderText: String
    @Binding var text: String
    @State private var isEditing = false

    public init(placeHolder: String,
                text: Binding<String>) {
        self._text = text
        self.placeHolderText = placeHolder

    }
    
    var shouldPlaceHolderMove: Bool {
        isEditing || (text.count != 0)
    }
    @ObservedObject var textValidator = TextValidator()
    
    var body: some View {
        VStack(alignment:.leading,spacing:2){
        ZStack(alignment: .leading) {
            TextField("", text: $text, onEditingChanged: { (edit) in
                isEditing = edit
            })
            .textFieldStyle(CustomTextFieldStyle(foregroundColor:Color.blue))
            .secure
            ///Floating Placeholder
            Text(placeHolderText)
                .foregroundColor(Color.secondary)
                .padding(shouldPlaceHolderMove ?
                         EdgeInsets(top: 0, leading:15, bottom: (height ?? UIScreen.main.bounds.size.height / 15), trailing: 0) :
                            EdgeInsets(top: 0, leading:15, bottom: 0, trailing: 0))
                .scaleEffect(shouldPlaceHolderMove ? 1.0 : 1.2)
                .animation(.linear)
                .onTapGesture {
                    isEditing = true
                }
                .font(.system(size: 13))
        }
            if (!$text.wrappedValue.isEmpty) {
                Text($text.wrappedValue)
                    .font(.system(size: 13))
                    .foregroundColor(Color.red)
                    .padding(EdgeInsets(top: 2, leading:0, bottom: 0, trailing: 0))
            }
        }
    }
    
}

struct CustomTextFieldStyle: TextFieldStyle {
    var leftIcon: Image? = nil
    var width: Double?
    var height: Double?
    var alignment: Alignment?
    var backgroundColor, foregroundColor, borderColor: Color?
    var cornerRadius: Double?
    var lineWidth: CGFloat?
    var borderWidth: Double?
    var contentPadding: CGFloat?
    var isSecure: Bool = false
    //    var shadowOrigin: CGRect?
    //    var shadowColor: Color?
    //
    func _body(configuration: TextField<Self._Label>) -> some View {
        textFieldConntentView(configuration: configuration)
            
            .font(.system(size: 13))
            .frame(width:(width ?? UIScreen.main.bounds.size.width / 1.25) , height:(height ?? UIScreen.main.bounds.size.height / 15), alignment: Alignment.center)
            .background(backgroundColor ?? Color.gray.opacity(0.5))
            .foregroundColor(foregroundColor ?? Color.black)
            .padding(contentPadding ?? 0)
        //  .shadow(color: shadowColor ?? Color.teal, radius: cornerRadius ?? 0, x: shadowOrigin?.x ?? 0, y: shadowOrigin?.y ?? 0)
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius ?? 0, style: .continuous)
                    .stroke(borderColor ?? Color(UIColor.systemGray4), lineWidth: lineWidth ?? 0)
            }
    }
    
    
    func textFieldConntentView(configuration: TextField<Self._Label>) -> AnyView {
        if(leftIcon != nil) {
            return AnyView(HStack {
                leftIcon
                    .foregroundColor(Color(UIColor.systemGray4))
                
                configuration
            })
        }
        return AnyView(configuration)
    }
}

class TextValidator: ObservableObject {

    @Published var text = ""

}

