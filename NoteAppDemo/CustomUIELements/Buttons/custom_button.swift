//
//  custom_button.swift
//  NoteAppDemo
//
//  Created by Ravi Lakhtariya on 29/11/22.
//

import SwiftUI

struct CustomButton: View {
    var button_text: String?
    var text_Color: Color?
    var button_left_image: String?
    var button_right_image: String?
    let action: () -> Void
    
    init(button_text:String?,text_color:Color = AppThemeColor.textColor,button_left_image: String = "",button_right_image: String = "", action: @escaping ()-> Void){
        self.button_text = button_text
        self.action = action
        self.button_left_image = button_left_image
        self.button_right_image = button_right_image
        self.text_Color = text_color
    }
    
    var body: some View {
        Button(action: action) {
            HStack() {
                getCustomImage(imageType: .system, imageString: button_left_image ?? "")
                Text(button_text ?? "").foregroundColor(text_Color)
                getCustomImage(imageType: .system, imageString: button_right_image ?? "")
            }
        }
    }
    
    func getCustomImage(imageType:ImageType = .system, imageString:String = "") -> Image {
        let image = FetchTypeOfImage(imagetype: imageType, imageString:imageString )
        return image.getCustomImage();
    }
}



struct CustomButtonStyle: ButtonStyle {
    
    var _width: CGFloat = UIScreen.main.bounds.size.width
    var _height: CGFloat = 50
    var _contentPadding: CGFloat = 0
    var _cornerRadius: CGFloat = 0
    var _alignment: Alignment = Alignment.center
    var _borderWidth: Double = 0.0
    var _lineLimit: Int = 1
    var _backgroundColor: Color = Color.white
    var _foregroundColor: Color = Color.black
    var _borderColor: Color = Color.black
    var _shadowOrigin: CGRect = CGRect.zero
    var _shadowColor: Color = Color.white
    
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
    
    var lineLimit: Int {
        get {
            return _lineLimit
        } set {
            self._lineLimit = newValue
        }
    }
    
    var shadowOrigin: CGRect {
        get {
            return _shadowOrigin
        } set {
            self._shadowOrigin = newValue
        }
    }
    
    var shadowColor: Color {
        get {
            return _shadowColor
        } set {
            self._shadowColor = newValue
        }
    }
    
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: width, height: height, alignment: alignment)
            .padding(contentPadding)
            .lineLimit(lineLimit)
            .minimumScaleFactor(0.7)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
            .cornerRadius(cornerRadius)
            .shadow(color: shadowColor, radius: cornerRadius, x: shadowOrigin.minX, y: shadowOrigin.minY)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(borderColor, lineWidth: borderWidth)
            )
    }
}


