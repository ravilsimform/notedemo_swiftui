//
//  RegistrationValidator.swift
//  NoteAppDemo
//
//  Created by Ravi Lakhtariya on 22/08/23.
//

import Foundation
enum FieldType {
    case text,email,mobileno,password
}
struct RegistrationValidator {
    
    static func checkValidation(fieldValue: String?,field:FieldType) -> (String?) {
        guard fieldValue != nil && ((fieldValue?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty) == nil) else {
            return ("Please enter details")
        }
        switch field {
        case .email:
            return nil
        case .mobileno:
            if((fieldValue?.count ?? 0) < 10) {
                return "Please Enter valid number"
            }
            return nil
        case .password:
            if((fieldValue?.count ?? 0) < 6) {
                return "Your password must has 6 characters"
            }
            return nil
        default:
            return "Error"
        }
        
    }
}
