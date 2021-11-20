//
//  CDBookType+CoreDataProperties.swift
//  GNIT Library System
//
//  Created by Arindam Santra on 16/09/21.
//
//

import Foundation
import CoreData


extension CDBookType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDBookType> {
        return NSFetchRequest<CDBookType>(entityName: "CDBookType")
    }

    @NSManaged public var about: String?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var toBook: Set<CDBook>?

}

// MARK: Generated accessors for toBook
extension CDBookType {

    @objc(addToBookObject:)
    @NSManaged public func addToToBook(_ value: CDBook)

    @objc(removeToBookObject:)
    @NSManaged public func removeFromToBook(_ value: CDBook)

    @objc(addToBook:)
    @NSManaged public func addToToBook(_ values: Set<CDBook>)

    @objc(removeToBook:)
    @NSManaged public func removeFromToBook(_ values: Set<CDBook>)

}

extension CDBookType : Identifiable {

}
