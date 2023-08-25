//
//  HomeViewModel.swift
//  NoteAppDemo
//
//  Created by Ravi Lakhtariya on 22/08/23.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    
    @Published var notes: [NoteModel]?
    @Published var notesDict: [String:Any]?
    @Published var showProgress: Bool = false
    
  
    init() {
        
    }
    
   final func fetchAllNotes()  {
        showProgress = true
        do {
            notes =  NoteModel.createMockTest()
            if((notes?.count ?? 0) > 0) {
                showProgress = false
            }
           // await groupDictionary(notes: notes ?? [])
        } catch  {
            showProgress = false
           // showProgress = false
            return;
        }
    }
    
    
//    final func groupDictionary(notes:[NoteModel]) async {
//        notesDict = Dictionary(grouping: notes) { (note) -> DateComponents in
//            let date = Calendar.current.dateComponents([.day, .year, .month], from: (note.updatedDate))
//            return date
//        }
//        print(notesDict)
//    }
    
    
    
}
