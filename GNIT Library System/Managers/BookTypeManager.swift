//
//  BookTypeManager.swift
//  GNIT Library System
//
//  Created by Arindam Santra on 13/09/21.
//

import Foundation

struct BooktypeManager{
    let bookTypeRepo = BookTypeDataRepository()
    
    func createBookType(type: BookType){
        bookTypeRepo.create(bookTypeInfo: type)
    }
    
    func fetchBookType()-> [BookType]? {
        return bookTypeRepo.getAll()
    }
    
    func fetchBookTypeBy(identifier: UUID)-> CDBookType?{
        return bookTypeRepo.getCDBookTypeByIdentifier(id: identifier)
    }
    
    func deleteBookType(type: BookType)-> Bool{
        return bookTypeRepo.delete(id: type.id)
    }
    
    func updateBookType(type: BookType)-> Bool{
        return bookTypeRepo.update(bookType: type)
    }
    
    
}
