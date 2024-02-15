//
//  Task+CoreDataProperties.swift
//  ToDoList
//
//  Created by Conner Wattles on 2/13/24.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var name: String?
    @NSManaged public var timestamp: Date?

}

extension Task : Identifiable {

}
