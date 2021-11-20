//
//  CDBook+CoreDataProperties.swift
//  GNIT Library System
//
//  Created by Arindam Santra on 16/09/21.
//
//

import Foundation
import CoreData


extension CDBook {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDBook> {
        return NSFetchRequest<CDBook>(entityName: "CDBook")
    }

    @NSManaged public var authorName: String?
    @NSManaged public var desription: String?
    @NSManaged public var id: UUID?
    @NSManaged public var isAssigned: Bool
    @NSManaged public var name: String?
    @NSManaged public var publishers: String?
    @NSManaged public var toBookType: CDBookType?

}

extension CDBook : Identifiable {

}
