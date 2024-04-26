//
//  ChatInteractor.swift
//  ITSFest
//
//  Created by Grigory Don on 26.04.2024.
//  
//

import Foundation

final class ChatInteractor {
    weak var output: ChatInteractorOutput?
}

extension ChatInteractor: ChatInteractorInput {
}
