//
//  firebase_auth_services.swift
//  NoteAppDemo
//
//  Created by Ravi Lakhtariya on 29/11/22.
//

import Foundation
import FirebaseAuth

protocol FirebaseAuthServices {
    func signup(user: UserSignupRequestModel);
    func login(user: UserSignupRequestModel);
    func signout();
}

class FirebaseAuth: FirebaseAuthServices {
    
    func signup(user: UserSignupRequestModel) {
        Auth.auth().createUser(withEmail: user.email ?? "" , password: user.password ?? "" ) { (result,err) in
             if let error = err {
                 return
             }
             guard let user = result?.user else {return}
             let emailVarification = EmailVarification()
             if emailVarification.sendEmailVarification(currentUser: user) {
                 
             }
        }
        
    }
    
    func login(user: UserSignupRequestModel) {
        Auth.auth().signIn(withEmail: user.email ?? "" , password: user.password ?? "") { (result, err)  in
            if let error = err {
                return
            }
            guard let user = result?.user else {return}
            let emailVarification = EmailVarification()
            if emailVarification.sendEmailVarification(currentUser: user) {
                
            }
       
            
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
