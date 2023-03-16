//
//  dynamic_stack.swift
//  NoteAppDemo
//
//  Created by Ravi Lakhtariya on 16/03/23.
//

import Foundation
import SwiftUI
struct DynamicStack<Content: View>: View {

    var verticalAlignment: VerticalAlignment = VerticalAlignment.center
    var horizontalAlignment: HorizontalAlignment = HorizontalAlignment.center
    var spacing: CGFloat = 1.0
    var content: Content
    
    @Environment(\.horizontalSizeClass) private var sizeClass

    var body: some View {
        switch sizeClass {
        case .regular:
            hStack
        case .compact, .none:
            vStack
        @unknown default:
            vStack
        }
    }
}

private extension DynamicStack {
    var hStack: some View {
        HStack(
            alignment: verticalAlignment,
            spacing: spacing,
            content: {content}
        )
    }

    var vStack: some View {
        VStack(
            alignment: horizontalAlignment,
            spacing: spacing,
            content: {content}
        )
    }
}

