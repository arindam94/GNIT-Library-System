//
//  CDBookExtension.swift
//  GNIT Library System
//
//  Created by Arindam Santra on 16/09/21.
//

import Foundation

extension CDBook{
    func convertToBook()-> Book{
        return Book(_id: id!, _name: name!, _description: description, _authorName: authorName!, _isAssigned: isAssigned, _publishers: publishers!)
    }
}


extension BookType{
    func convertToCDBook()-> CDBookType{
        let cdBook = CDBookType(context: PersistantStorage.shared.context)
        cdBook.id = id
        cdBook.name = name
        cdBook.about = about
        return cdBook
    }
}
