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
    
    
    @State var isSelected: Bool = false
    @FocusState fileprivate var isFocused: Bool
    
    @State private var isEditing = false
    @State private var isKeyboardVisible = false;
    
    
    //MARK: Binding Property
    @Binding private var textFieldValue: String
    
    //MARK: Properties
    private var axis: Axis = .horizontal
    private var showFloatingLabel: Bool = false
    private var placeholderText: String = ""
    private var editingChanged: (Bool) -> () = { _ in }
    private var commit: () -> () = { }
    private var fieldType: FieldType = .text
    private var secureFiled: Bool = false
    
    
    public init(_ text: Binding<String>,
                isSecure: Bool = false,
                placeHolder: String = "",
                fieldType:FieldType = .text,
                showFloatingLabel:Bool = false,
                editingChanged: @escaping (Bool)->() = { _ in },
                commit: @escaping ()->() = { }) {
        
        self._textFieldValue = text
        self.secureFiled = isSecure
        self.placeholderText = placeHolder
        self.fieldType = fieldType
        self.showFloatingLabel = showFloatingLabel
        self.commit = commit
        self.editingChanged = editingChanged
    
    }
    
    var shouldPlaceHolderMove: Bool {
        isEditing || ((self.textFieldValue.count) != 0)
    }
    
    var body: some View {
        VStack(alignment:.leading,spacing:2) {
            ZStack(alignment: .leading) {
                if(secureFiled) {
                     SecureField(placeholderText, text: $textFieldValue)
                } else {
                     TextField(placeholderText, text: $textFieldValue)
                }
                floatingLabel
            }
            getErrorText()
        }.padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
    }
    
    

    @ViewBuilder
    var floatingLabel: some View {
        if(showFloatingLabel == true) {
            AnyView(Text(placeholderText)
                .foregroundColor(Color.secondary)
                    .scaleEffect(shouldPlaceHolderMove ? 1.0 : 1.1)
                    .onTapGesture {
                        isEditing = true
                    }
                .font(.system(size: 13)))
        }
        EmptyView()
    }
    
    func getErrorText() -> AnyView? {
        if (isKeyboardVisible) {
            return AnyView(Text((RegistrationValidator.checkValidation(fieldValue: self._textFieldValue.wrappedValue, field: self.fieldType) ?? ""))
                .font(.system(size: 13))
                .foregroundColor(Color.red)
                .padding(EdgeInsets(top: 2, leading:0, bottom: 0, trailing: 0)))
        }
        return nil
    }
    
}

struct CustomTextFieldStyle: TextFieldStyle {
    
    var _leftIcon: String = ""
    var _width: CGFloat = UIScreen.main.bounds.width
    var _height: CGFloat = 50
    var _alignment: Alignment = Alignment.leading
    
    var _backgroundColor: Color = Color.white
    var _foregroundColor: Color = Color.black
    var _borderColor: Color =  Color.black
    var _cornerRadius: CGFloat = 0.0
    var _lineWidth: CGFloat = 1.0
    var _borderWidth: Double = 0.0
    var _contentPadding: CGFloat = 2.0
    var _isSecure: Bool = false
    var _shadowOrigin: CGRect = CGRect.zero
    var _shadowColor: Color = Color.white
    
    
    var leftIcon: String {
        get {
            return self._leftIcon
        } set {
            self._leftIcon = newValue
        }
    }
    
    var width: CGFloat {
        get {
            return _width;
        } set {
            self._width = newValue
        }
    }
    
    var height: CGFloat {
        get {
            return _height;
        } set {
            self._height = newValue
        }
    }
    
    var contentPadding: CGFloat {
        get {
            return _contentPadding;
        } set {
            self._contentPadding = newValue
        }
    }
    
    var cornerRadius: CGFloat {
        get {
            return _cornerRadius;
        } set {
            self._cornerRadius = newValue
        }
    }
    
    var alignment: Alignment {
        get {
            return _alignment;
        } set {
            self._alignment = newValue
        }
    }
    
    var backgroundColor: Color {
        get {
            return _backgroundColor
        } set {
            self._backgroundColor = newValue
        }
    }
    
    var foregroundColor: Color {
        get {
            return _foregroundColor
        } set {
            self._foregroundColor = newValue
        }
    }
    
    var shadowColor: Color {
        get {
            return _shadowColor
        } set {
            self._shadowColor = newValue
        }
    }
    
    var borderColor: Color {
        get {
            return _borderColor
        } set {
            self._borderColor = newValue
        }
    }
    
    var borderWidth: Double {
        get {
            return _borderWidth
        } set {
            self._borderWidth = newValue
        }
    }
    
    var shadowOrigin: CGRect {
        get {
            return _shadowOrigin
        } set {
            self._shadowOrigin = newValue
        }
    }
    
    var lineWidth: Double {
        get {
            return _lineWidth
        } set {
            self._lineWidth = newValue
        }
    }
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        textFieldConntentView(configuration: configuration)
            .font(.system(size: 13))
        getPaddingView(configuration: configuration)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .shadow(color: shadowColor, radius: cornerRadius, x: shadowOrigin.minX, y: shadowOrigin.minY)
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .stroke(borderColor, lineWidth: lineWidth )
            }
    }
    
    func getFrameView(configuration: TextField<Self._Label>) -> AnyView {
        return AnyView(configuration.frame(width: 200) )
    }
    
    func getPaddingView(configuration: TextField<Self._Label>) -> AnyView {
        return AnyView(configuration.padding(EdgeInsets(top: 10, leading: 10, bottom: 5, trailing: 10)))
    }
    
    func textFieldConntentView(configuration: TextField<Self._Label>) -> AnyView {
        if(leftIcon != "") {
            return AnyView(HStack {
                Image(leftIcon)
                    .foregroundColor(Color(UIColor.systemGray4))
                
                configuration
            })
        }
        return AnyView(configuration)
    }
}
