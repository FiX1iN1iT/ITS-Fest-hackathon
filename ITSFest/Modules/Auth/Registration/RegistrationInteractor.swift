//
//  RegistrationInteractor.swift
//  ITSFest
//
//  Created by Александр Бобрун on 26.04.2024.
//
//

import Foundation

final class RegistrationInteractor {
    weak var output: RegistrationInteractorOutput?
    weak var authService: AuthService?
    
    init(authService: AuthService? = nil) {
        self.authService = authService
    }
    
    private func registerUser(_ model: AuthModel) async {
        do {
            let result = try await authService?.register(with: model)
            // output?.handleSuccess...
        } catch {
            // output?.handleError...
        }
    }
}

extension RegistrationInteractor: RegistrationInteractorInput {
    func register(model: AuthModel) {
        Task {
            do {
                let result = try await authService?.register(with: model)
                // output?.handleSuccess...
            } catch {
                // output?.handleError...
            }
        }
    }
}
