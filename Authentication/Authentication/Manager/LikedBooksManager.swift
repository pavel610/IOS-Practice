//
//  LikedBooksManager.swift
//  Authentication
//
//  Created by Павел Калинин on 02.07.2024.
//

import Foundation

class LikedBooksManager {
    static let shared = LikedBooksManager()
    private init() {}
    private var likedBooksByUser = [String:[Book]]()
    
    func getLikedBooks(user: User) -> [Book] {
        likedBooksByUser[user.login] ?? []
    }
    
    func addLikedBook(user: User, book: Book) {
        likedBooksByUser[user.login]?.append(book)
    }
}
