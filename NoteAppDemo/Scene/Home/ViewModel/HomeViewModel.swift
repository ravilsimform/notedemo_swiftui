//
//  HomeViewModel.swift
//  NoteAppDemo
//
//  Created by Ravi Lakhtariya on 22/08/23.
//

import Foundation
import Combine

@MainActor
class HomeViewModel: ObservableObject {
    
    @Published var notes: [NoteModel]?
    @Published var showProgress: Bool = false
    
  
    init() {
        
    }
    
   final func fetchAllNotes() async {
        showProgress = true
        do {
            
        } catch {
            showProgress = false
           // showProgress = false
            return;
        }
    }
    
    
    
    
}
