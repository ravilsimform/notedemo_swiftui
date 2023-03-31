//
//  custom_button.swift
//  NoteAppDemo
//
//  Created by Ravi Lakhtariya on 29/11/22.
//

import SwiftUI

struct CustomButton: View {
    var button_text: String?
    var button_left_image: String?
    var button_right_image: String?
    let action: () -> Void
    
    init(button_text:String?,button_left_image: String = "",button_right_image: String = "", action: @escaping ()-> Void){
        self.button_text = button_text
        self.action = action
        self.button_left_image = button_left_image
        self.button_right_image = button_right_image
    }
    
    var body: some View {
        Button(action: action) {
            HStack() {
                
                getCustomImage(imageType: .system, imageString: "star.fill")
                Text(button_text ?? "")
                getCustomImage()
            }
        }.buttonStyle(CustomButtonStyle())
    }
    
    func getCustomImage(imageType:ImageType = .system, imageString:String = "") -> Image {
        let image = FetchTypeOfImage(imagetype: imageType, imageString:imageString )
        return image.getCustomImage();
    }
}



struct CustomButtonStyle: ButtonStyle {
    
    private var _width: CGFloat = UIScreen.main.bounds.size.width
    private var _height: CGFloat = 50
    private var _contentPadding: CGFloat = 0
    private var _cornerRadius: CGFloat = 0
    private var _alignment: Alignment = Alignment.center
    private var _borderWidth: Double = 1.0
    private var _lineLimit: Int = 1
    private var _backgroundColor: Color = Color.white
    private var _foregroundColor: Color = Color.black
    private var _borderColor: Color = Color.black
    
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
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(borderColor, lineWidth: borderWidth)
            )
    }
}


