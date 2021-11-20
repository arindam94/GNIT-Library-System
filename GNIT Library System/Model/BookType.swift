//
//  BookType.swift
//  GNIT Library System
//
//  Created by Arindam Santra on 13/09/21.
//

import Foundation

class BookType {
    var id: UUID
    var about: String?
    var name: String?
    var books: [Book]?
    
    init(_id: UUID, _about: String, _name: String, _books: [Book]?) {
        self.id = _id
        self.about = _about
        self.name = _name
        self.books = _books
    }
    
}
