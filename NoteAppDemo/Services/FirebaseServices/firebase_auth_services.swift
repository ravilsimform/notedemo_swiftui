//
//  firebase_auth_services.swift
//  NoteAppDemo
//
//  Created by Ravi Lakhtariya on 29/11/22.
//

import Foundation
import FirebaseAuth

protocol FirebaseAuthServices {
    func signup(user: UserModel);
    func login(user: UserModel);
    func signout();
}

class FirebaseAuth: FirebaseAuthServices {
    
    func signup(user: UserModel) {
        Auth.auth().createUser(withEmail: user.email ?? "", password: user.password ?? "") { (result,error) in
            
        }
    }
    
    func login(user: UserModel) {
        Auth.auth().signIn(withEmail: user.email ?? "", password: user.password ?? "") { (result, error)  in
            
        }
    }
    
    func signout() {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}
