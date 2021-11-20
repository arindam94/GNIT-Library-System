//
//  Book.swift
//  GNIT Library System
//
//  Created by Arindam Santra on 16/09/21.
//

import Foundation
/*
 SManaged public var authorName: String?
 @NSManaged public var desription: String?
 @NSManaged public var id: UUID?
 @NSManaged public var isAssigned: Bool
 @NSManaged public var name: String?
 @NSManaged public var publishers: String?
 @NSManaged public var toBookType: CDBookType?

 */

class Book{
    var id: UUID
    var name: String
    var description: String
    var authorName: String
    var isAssigned: Bool
    var publishers: String
    
    init(_id: UUID, _name: String, _description: String, _authorName:String, _isAssigned: Bool, _publishers: String) {
        self.id = _id
        self.name = _name
        self.description = _description
        self.authorName = _authorName
        self.isAssigned = _isAssigned
        self.publishers = _publishers
    }
}
