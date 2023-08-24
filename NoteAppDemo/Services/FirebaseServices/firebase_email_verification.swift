//
//  firebase_email_verification.swift
//  NoteAppDemo
//
//  Created by Ravi Lakhtariya on 28/03/23.
//

import Foundation
import FirebaseAuth
protocol FirebaseEmailVarification {
    func sendEmailVarification(currentUser: User) -> Bool;
}

struct EmailVarification : FirebaseEmailVarification {
    
    
    func sendEmailVarification(currentUser: User) -> Bool {
        
        if(!(Auth.auth().currentUser?.isEmailVerified ?? true)) {
             Auth.auth().currentUser?.sendEmailVerification()
            return true;

        }
        return false
    }
    
    func getActionSettings(currentUser: User) -> ActionCodeSettings {
        var actionCodeSettings = ActionCodeSettings()
        actionCodeSettings.handleCodeInApp = false
        //setcustom url to send email
        // This URL will be the deep link of the FDL. It is useful for
        // passing state back to your iOS app to let it know that you were
        // verifying a user of email user.email. This is also useful
        // in case the user clicks the continue button a non iOS device.
        // You should own this link.
      /*  actionCodeSettings.URL =
            String(format: "https://www.example.com/?email=%@", user.email)*/
        actionCodeSettings.setIOSBundleID(AppInfo.getBundleId())
        return actionCodeSettings
    }
}
