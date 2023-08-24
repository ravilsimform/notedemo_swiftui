//
//  string_extension.swift
//  NoteAppDemo
//
//  Created by Ravi Lakhtariya on 29/03/23.
//

import Foundation

extension String {
    
    func toJSON() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
    
}
