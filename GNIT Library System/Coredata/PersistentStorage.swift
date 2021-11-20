//
//  PersistentStorage.swift
//  GNIT Library System
//
//  Created by Arindam Santra on 09/09/21.
//

import Foundation
import CoreData

final class PersistantStorage {
    
    private init(){}
    static let shared = PersistantStorage()
    
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "GNIT_Library_System")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    lazy var context = persistentContainer.viewContext
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchRequest<T: NSManagedObject>(mangeObject: T.Type) -> [T]?{
        do{
            guard let result = try PersistantStorage.shared.context.fetch(mangeObject.fetchRequest()) as? [T] else{return nil}
            return result
        }
        catch{
            return nil
        }
    }
    
    
    func fetchRequestWithPredicate<T: NSManagedObject>(mangeObject: T.Type, predicate: NSPredicate) -> [T]?{
        do{
            let request = mangeObject.fetchRequest()
            request.predicate = predicate
            guard let result = try PersistantStorage.shared.context.fetch(mangeObject.fetchRequest()) as? [T] else{return nil}
            return result
        }
        catch{
            return nil
        }
    }
}
