//
//  DTO.swift
//  ITSFest
//
//  Created by Alexander on 27.04.2024.
//

import Foundation
import Firebase

// MARK: - User

struct TaskServiceUser: Decodable {
    let projects: [DocumentReference]?
}

// MARK: - Project

struct TaskServiceProject: Decodable {
    let tasks: [DocumentReference]?
}

// MARK: - Task

struct TaskServiceTask: Decodable {
    let title: String
    let date: Date
}
