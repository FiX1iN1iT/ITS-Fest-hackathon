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
    var authService: AuthService?
    
    init(authService: AuthService? = nil) {
        self.authService = authService
    }
    
    private func registerUser(_ model: AuthModel) async {
        do {
            let result = try await authService?.register(with: model)
            output?.successRegistration(with: result)
        } catch (let error) {
            output?.failureRegistration(with: error)
        }
    }
}

extension RegistrationInteractor: RegistrationInteractorInput {
    func register(model: AuthModel) {
        Task {
            do {
                let result = try await authService?.register(with: model)
                // output?.handleSuccess...
                print(result)
            } catch (let error) {
                print(error.localizedDescription)
                // output?.handleError...
            }
        }
    }
}
