//
//  NoteModel.swift
//  NoteAppDemo
//
//  Created by Ravi Lakhtariya on 22/08/23.
//

import Foundation

// MARK: - Welcome
struct NoteModel: Codable,Identifiable {
    var id: UUID
    var updatedDate: Date
    var textData: String
    
}
