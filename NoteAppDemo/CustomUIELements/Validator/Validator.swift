//
//  Validator.swift
//  NoteAppDemo
//
//  Created by Ravi Lakhtariya on 17/03/23.
//

import Foundation
import SwiftUI


/*struct Valdiator {
   static func textFieldValidatorEmail(_ string: String) -> Bool {
            if string.count > 100 {
                return false
            }
            let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}" // short format
            let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
            return emailPredicate.evaluate(with: string)
    }
}*/

class Validator<T: Hashable>: ObservableObject
  {
    @Published private var validStates: [T: Bool] = [:]

    public var isValid: Bool
      {
        var isValid = true

        for (_, validState) in validStates {
          isValid = isValid && validState
        }

        return isValid
      }


    public func reset() -> Void
      {
        validStates.removeAll()
      }


    public func bindingFor(identifier: T) -> Binding<Bool>
      {
        // Ensure we have an entry for the given identifier
        if validStates[identifier] == nil {
          validStates[identifier] = true
        }

        return Binding(get: { self.validStates[identifier]! }, set: { newValue in self.validStates[identifier] = newValue })
      }
  }
