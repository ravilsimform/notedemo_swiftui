//
//  DetailViewModel.swift
//  NoteAppDemo
//
//  Created by Ravi Lakhtariya on 24/08/23.
//

import Foundation

final class DetailViewModel: ObservableObject {
    
    @Published var titleTextField: String = ""
    @Published var descriptionTextField: String = ""
    @Published var note: NoteModel? = nil
    
    init(){
        
    }
}
