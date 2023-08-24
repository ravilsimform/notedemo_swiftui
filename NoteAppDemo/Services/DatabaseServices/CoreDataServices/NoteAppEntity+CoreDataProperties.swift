//
//  NoteAppEntity+CoreDataProperties.swift
//  
//
//  Created by Ravi Lakhtariya on 24/08/23.
//
//

import Foundation
import CoreData


extension NoteAppEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NoteAppEntity> {
        return NSFetchRequest<NoteAppEntity>(entityName: "NoteAppEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var noteText: String?
    @NSManaged public var updatedDate: Date?

}
