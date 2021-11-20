//
//  BookTypeDataRepository.swift
//  GNIT Library System
//
//  Created by Arindam Santra on 11/09/21.
//

import Foundation
import CoreData
protocol BookTypeRepository {
    func create(bookTypeInfo: BookType)
    func delete(id: UUID)-> Bool
    func getAll()-> [BookType]?
}


struct BookTypeDataRepository: BookTypeRepository {
    func create(bookTypeInfo: BookType) {
        let bookType = CDBookType(context: PersistantStorage.shared.context)
        bookType.id = bookTypeInfo.id
        bookType.name = bookTypeInfo.name
        bookType.about = bookTypeInfo.about
        bookType.toBook = nil
        PersistantStorage.shared.saveContext()
    }
    
    func delete(id: UUID)-> Bool {
        let cdBookType = getCDBookTypeByIdentifier(id: id)
        guard cdBookType != nil else {return false}

        PersistantStorage.shared.context.delete(cdBookType!)
        PersistantStorage.shared.saveContext()
        return true
    }
    
    func update(bookType: BookType)-> Bool{
        let cdBookType = getCDBookTypeByIdentifier(id: bookType.id)
        guard cdBookType != nil else {return false}

        
        if(bookType.books != nil && bookType.books?.count != 0)
        {
            var bookSet = Set<CDBook>()
            bookType.books?.forEach({ (eachBook) in

                let cdBook = CDBook(context: PersistantStorage.shared.context)
                cdBook.id = eachBook.id
                cdBook.name = eachBook.name
                cdBook.authorName = eachBook.authorName
                cdBook.publishers = eachBook.publishers
                cdBook.desription = eachBook.description
                cdBook.isAssigned = eachBook.isAssigned
                bookSet.insert(cdBook)
            })

            cdBookType?.toBook = bookSet
            
        }
        PersistantStorage.shared.saveContext()
       return true

    }
    
    
    
    func getAll() -> [BookType]? {
        var bookTypeResult = [BookType]()

        guard let result = PersistantStorage.shared.fetchRequest(mangeObject: CDBookType.self) else {
            return nil
        }
        
        result.forEach { eachValue in
        bookTypeResult.append(eachValue.convertToBookType())
        }
        return bookTypeResult
    }
    
    func getCDBookTypeByIdentifier(id: UUID)-> CDBookType?{
        let fetchRequest = NSFetchRequest<CDBookType>(entityName: "CDBookType")
        let predicate = NSPredicate(format: "id==%@", id as CVarArg)
        fetchRequest.predicate = predicate
        
        do {
            let result = try PersistantStorage.shared.context.fetch(fetchRequest).first
            return result
        } catch let error {
            return nil
        }
        return nil
    }
    
    
}
