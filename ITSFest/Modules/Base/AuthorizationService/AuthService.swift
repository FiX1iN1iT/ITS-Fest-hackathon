//
//  Service.swift
//  ITSFest
//
//  Created by Grigory Don on 26.04.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

final class AuthService {
    
    func register(with model: AuthModel) async throws -> AuthDataResult {
        return try await Auth.auth().createUser(withEmail: model.email, password: model.password)
    }
    
    func signIn(with email: String, and password: String) async throws -> AuthDataResult {
        let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
        return authResult
    }
}
