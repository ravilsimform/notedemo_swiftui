//
//  NoteModel.swift
//  NoteAppDemo
//
//  Created by Ravi Lakhtariya on 22/08/23.
//

import Foundation

// MARK: - Welcome
struct NoteModel {
    var id: Int
    var updatedDate: Date
    var noteTitle: String
    var noteDesc: String
    
    
    init(id: Int, updatedDate: Date, noteTitle: String, noteDesc: String) {
        self.id = id
        self.updatedDate = updatedDate
        self.noteTitle = noteTitle
        self.noteDesc = noteDesc
    }
    
    
    static func createMockTest() -> [NoteModel] {
        return [
            NoteModel(id: 1, updatedDate: Date(), noteTitle: "Go To Gym", noteDesc: "Back workout"),
            NoteModel(id: 2, updatedDate: Date(), noteTitle: "CarWash", noteDesc: "Downtown car wash center"),
            NoteModel(id: 3, updatedDate: Date(), noteTitle: "Office Work", noteDesc: "Finish Picker Module")
        ]
    }
}
