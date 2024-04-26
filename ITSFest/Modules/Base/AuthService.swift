//
//  Service.swift
//  ITSFest
//
//  Created by Grigory Don on 26.04.2024.
//

import Foundation
import FirebaseAuth

final class AuthService {
    
    func register(with email: String, and password: String, completion: @escaping (Bool, Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(false, error)
            } else {
                completion(true, nil)
            }
        }
    }
}


