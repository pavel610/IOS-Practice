//
//  extension+UserDefaults.swift
//  Authentication1
//
//  Created by Павел Калинин on 03.07.2024.
//

import Foundation
import UIKit

extension UserDefaults {
    func getBooks(forKey key: String) -> [Book] {
        if let books = array(forKey: key) as? [Book.ID] {
            print(1)
            return books.compactMap { id in
                BooksManager.shared.getBook(by: id)
            }
        }
        return []
    }
    
    func setBooks(_ books: [Book], forKey key: String) {
        setValue(books.compactMap({ book in
            book.id
        }), forKey: key)
        print(books.compactMap({ book in
            book.id}))
    }
}
