//
//  CDBooktypeExtension.swift
//  GNIT Library System
//
//  Created by Arindam Santra on 16/09/21.
//

import Foundation
extension CDBookType{
    func convertToBookType()-> BookType{
        return BookType(_id: id!, _about: about!, _name: name!, _books: convertToBooks())
    }
    
    private func convertToBooks() -> [Book]?{
        guard self.toBook != nil && self.toBook?.count != 0 else {return nil}
        var books: [Book] = []
        
        self.toBook?.forEach({ (cdVehicle) in
            books.append(cdVehicle.convertToBook())
        })
        return books
    }
}

