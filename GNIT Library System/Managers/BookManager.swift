//
//  BookManager.swift
//  GNIT Library System
//
//  Created by Arindam Santra on 16/09/21.
//

import Foundation

struct BookManager{
    let bookTypeRepo = BookDataRepository()
    
    func createBookType(bookList: Book,bookTypeId: CDBookType){
        bookTypeRepo.create(bookList: bookList, booktypeId: bookTypeId)
    }
    
    func fetchBookType(type: BookType)-> [Book]? {
        return bookTypeRepo.getAll(selctedBookType: type)
    }
    
    func deleteBookType(type: BookType)-> Bool{
        return bookTypeRepo.delete(id: type.id)
    }
    
}
