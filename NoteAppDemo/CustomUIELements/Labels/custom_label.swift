//
//  custom_label.swift
//  NoteAppDemo
//
//  Created by Ravi Lakhtariya on 16/03/23.
//

import Foundation
import SwiftUI

enum EnumLabelStyle {
    case icon, label, iconlabel
}

struct CustomLabelStyle: LabelStyle {
    
    var labelStyle: EnumLabelStyle?
    var iconColor: Color?
    var labelColor: Color?
    var backgroundColor: Color?
    var isRow: Bool = false
    
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
      
    func makeBody(configuration: Configuration) -> some View {
        if (labelStyle == .iconlabel) {
            if(isRow) {
                HStack {
                    configuration.icon
                        .foregroundColor(iconColor)
                    configuration.title
                        .foregroundColor(labelColor)
                        .font(.system(size: 20))
                }
                .background(labelColor ?? Color.white)
            }
            else {
                VStack {
                    configuration.icon
                        .foregroundColor(iconColor)
                    configuration.title
                        .foregroundColor(labelColor)
                        .font(.system(size: 20))
                }
                .background(labelColor ?? Color.white)
            }
        } else {
            Label(configuration)
                .multilineTextAlignment(.trailing)
                .foregroundColor(labelColor)
                .background(backgroundColor ?? Color.white)
                .font(.title)
                
        }
        
    }
    
    
    
}
