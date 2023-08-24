//
//  CustomShapes.swift
//  NoteAppDemo
//
//  Created by Ravi Lakhtariya on 23/08/23.
//

import SwiftUI
   
struct DShape: Shape {
        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath()
            path.move(to: .zero)
            path.addLine(to: CGPoint(x: (rect.width / 2) * 1.5 , y: 0))
            path.addLine(to: CGPoint(x: (rect.width / 2) * 1.5, y: 65))
            path.addLine(to: CGPoint(x: (rect.width / 1.5) + 100, y: 65))
            path.addLine(to: CGPoint(x: (rect.width / 1.5) + 100, y: 0))
            path.addLine(to: CGPoint(x: rect.width , y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 100))
            path.addLine(to: CGPoint(x: 0, y: 100))
            path.addLine(to: .zero)
            path.close()
            return Path(path.cgPath)
            
        }
    }

