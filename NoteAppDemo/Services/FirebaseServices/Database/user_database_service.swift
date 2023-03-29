//
//  user_database_service.swift
//  NoteAppDemo
//
//  Created by Ravi Lakhtariya on 29/03/23.
//

import Foundation
import FirebaseFirestore

struct UserDatabase: BaseRepository {
    
    private var db = Firestore.firestore()
    func create(record: UserSignupResponseModel) async throws {
        do {
             let result = try? await db.collection("users").document(record.uId).setData(record.encodedJson())
            print(result)
            
           }
           catch let error {
             print("Error writing city to Firestore: \(error)")
             //completion(nil, error)
           }

    }
}

