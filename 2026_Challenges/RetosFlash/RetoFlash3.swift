//
//  RetoFlash3.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 15/06/26.
//

// Data
import Foundation

struct UserDTO: Decodable {
    let id: Int
    let name: String
    let email: String
    
    func toEntity() -> User {
        User(
            id: self.id,
            name: self.name,
            email: self.email
        )
    }
}

final class UserRepositoryImpl: UserRepositoryProtocol {
    
    var users: [User] = [
        User(id: 1, name: "Alan", email: "alan.com"),
        User(id: 2, name: "Bob", email: "bob.com"),
        User(id: 3, name: "Camila", email: "camila.com")
    ]
    
    func getProfile(id: Int) throws -> User {
        guard let user = users.first(where: { $0.id == id }) else {
            throw UserError.userNotFound
        }
        
        return user
    }
    
    func updateName(id: Int, newName: String) throws {
        guard let index = users.firstIndex(where: { $0.id == id }) else { throw UserError.userNotFound }
        users[index].name = newName
    }
}




// Domain
enum UserError: Error {
    case userNotFound
    case invalidName
    
    var localizedDescription: String {
        switch self {
        case .userNotFound: return "User not found"
        case .invalidName: return "Invalid name"
        }
    }
}

struct User {
    let id: Int
    var name: String
    var email: String
}

protocol UserRepositoryProtocol {
    func getProfile(id: Int) throws -> User
    func updateName(id: Int, newName: String) throws
}

struct GetProfileUseCase {
    
    let repository: UserRepositoryProtocol
    
    init(repository: UserRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(id: Int) throws -> User {
        try repository.getProfile(id: id)
    }
}

struct UpdateNameUseCase {
    
    let repository: UserRepositoryProtocol
    
    init(repository: UserRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(id: Int, newName: String) throws {
        try repository.updateName(id: id, newName: newName)
    }
}


// Presentation

import Combine

class ProfileViewModel: ObservableObject {
    
    var updateName: UpdateNameUseCase
    let getProfile: GetProfileUseCase
    
    @Published var errorMessage: String = ""
    @Published var currentUser: User?
    
    init(updateName: UpdateNameUseCase, getProfile: GetProfileUseCase) {
        self.updateName = updateName
        self.getProfile = getProfile
    }
    
    func updateName(id: Int, newName: String) {
        do {
            try updateName.execute(id: id, newName: newName)
        } catch {
            print(error)
        }
    }
    
    func getProfile(id: Int) {
        do {
            self.currentUser = try getProfile.execute(id: id)
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }
}
