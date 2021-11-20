//
//  BookDataRepository.swift
//  GNIT Library System
//
//  Created by Arindam Santra on 16/09/21.
//



import Foundation
import CoreData
protocol BookRepository {
    func create(bookList: Book, booktypeId: CDBookType)
    func delete(id: UUID)-> Bool
    func getAll(selctedBookType: BookType)-> [Book]?
}


struct BookDataRepository: BookRepository {
    func create(bookList: Book, booktypeId: CDBookType) {
        let bookDataRepository = BookTypeDataRepository()
        let book = CDBook(context: PersistantStorage.shared.context)
        book.name = bookList.name
        book.id = bookList.id
        book.authorName = bookList.authorName
        book.isAssigned = bookList.isAssigned
        book.publishers = bookList.publishers
        book.desription = "hahahah"
        book.toBookType = booktypeId
        PersistantStorage.shared.saveContext()

        
    }
    
    func delete(id: UUID)-> Bool {
        let cdBookType = getCDBookTypeByIdentifier(id: id)
        guard cdBookType != nil else {return false}

        PersistantStorage.shared.context.delete(cdBookType!)
        PersistantStorage.shared.saveContext()
        return true
    }
    
    func getAll(selctedBookType: BookType) -> [Book]? {
        var bookResult = [Book]()
        let predicate = NSPredicate(format: "toBookType.id MATCHES %@", selctedBookType.id as CVarArg)
        let result = PersistantStorage.shared.fetchRequestWithPredicate(mangeObject: CDBook.self, predicate: predicate)
        result!.forEach { eachValue in
            bookResult.append(eachValue.convertToBook())
        }
        return bookResult
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
