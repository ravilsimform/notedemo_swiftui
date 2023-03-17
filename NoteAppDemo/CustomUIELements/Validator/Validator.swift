//
//  Validator.swift
//  NoteAppDemo
//
//  Created by Ravi Lakhtariya on 17/03/23.
//

import Foundation

struct Valdiator {
   static func textFieldValidatorEmail(_ string: String) -> Bool {
            if string.count > 100 {
                return false
            }
            let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}" // short format
            let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
            return emailPredicate.evaluate(with: string)
    }
}
