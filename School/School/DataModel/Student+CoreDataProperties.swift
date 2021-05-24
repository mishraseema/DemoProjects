//
//  Student+CoreDataProperties.swift
//  School
//
//  Created by Seema Pandey on 01/02/21.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var course: Course?

}

extension Student : Identifiable {

}
