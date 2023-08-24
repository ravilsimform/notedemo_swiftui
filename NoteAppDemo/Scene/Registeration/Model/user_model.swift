//
//  user_model.swift
//  NoteAppDemo
//
//  Created by Ravi Lakhtariya on 29/11/22.
//

import Foundation

struct UserSignupRequestModel: Encodable {
    
    var firstName, lastName, email, password,confirmPassword: String?
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case email, password
    }
    
}

struct UserSignupResponseModel: Encodable,Decodable {
    
    let uId, firstName, lastName, email, password: String?
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case email, password, uId
    }
    
    
}

extension Encodable {
    func encodedJson() -> [String:Any] {
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(self)
            return try JSONSerialization.jsonObject(with: jsonData) as! [String : Any]
            
        } catch {
            return ["error": error]
        }
    }
}
