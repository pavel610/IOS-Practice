//
//  AuthManager.swift
//  Authentication
//
//  Created by Павел Калинин on 01.07.2024.
//

import Foundation
import UIKit


class AuthManager {
    
    static var shared = AuthManager()
    private init() {}
    private var users = [User(login: "pkb@gmail.com", password: "12345678", fullName: "Андрей", birthDate: "20.10.1987", contactInfo: "81234567890", bio: "андрей - Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent lacinia nisl a elit scelerisque feugiat. Curabitur mi purus, tempor in orci ac, ultrices tristique magna. Nam aliquet blandit mollis.", avatar: .photo), User(login: "ppbb@gmail.com", password: "11223344", fullName: "Егор", birthDate: "02.10.1973", contactInfo: "81239999900", bio: "егор - Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent lacinia nisl a elit scelerisque feugiat. Curabitur mi purus, tempor in orci ac, ultrices tristique magna. Nam aliquet blandit mollis.", avatar: .photo)]
    
    func LogInUser(login: String, pass: String) -> User? {
        return users.first(where: { $0.login == login && $0.password == pass })
    }
                         
}
