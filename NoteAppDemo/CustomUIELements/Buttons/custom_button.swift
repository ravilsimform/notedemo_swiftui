//
//  custom_button.swift
//  NoteAppDemo
//
//  Created by Ravi Lakhtariya on 29/11/22.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    
    var width: Double?
    var height: Double?
    var alignment: Alignment?
    var backgroundColor, foregroundColor, borderColor: Color?
    var cornerRadius: Double?
    var borderWidth: Double?
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: width ?? UIScreen.main.bounds.size.width / 1.5, height: height ?? UIScreen.main.bounds.size.height / 30, alignment: alignment ?? Alignment.center)
            .padding()
            .lineLimit(1)
            .minimumScaleFactor(0.7)
            .background(backgroundColor ?? Color.blue)
            .foregroundColor(foregroundColor ?? Color.white)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
            .cornerRadius(cornerRadius ?? 10.0)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius ?? 0)
                    .stroke(borderColor ?? Color.yellow, lineWidth: borderWidth ?? 0)
            )
    }
}

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

