//
//  StudentService.swift
//  School
//
//  Created by Seema Pandey on 01/02/21.
//

import Foundation
import CoreData

enum CourseType:String {
    case sandArt,Photography,painting,sketch
}

class StudentService {
    let moc:NSManagedObjectContext
    var students = [Student]()
    
    init(moc:NSManagedObjectContext) {
        self.moc = moc
    }
    
    // MARK: Add Student
    func addStudent(name:String, for courseType:CourseType, completion:(Bool,[Student]) -> Void) {
        let student = Student(context: moc)
        student.name = name
        
        guard let course = courseExist(courseType) else {
            completion(false,students)
            return
        }
        
        register(student: student, course: course)
        students.append(student)
        completion(true,students)
    }
    
    private func register(student:Student, course:Course) {
        student.course = course
    }
    
    //MARK:  Course
    func courseExist(_ courseType:CourseType) -> Course? {
        let request: NSFetchRequest<Course> = Course.fetchRequest()
        request.predicate = NSPredicate(format: "name = %@", courseType.rawValue) // name = course name
        var course: Course?
        do {
            let res = try moc.fetch(request)
            course = res.isEmpty ? addNewCourse(courseType:courseType) : res.first
            
        } catch {
            print(error.localizedDescription)
        }
        
        return course
    }
    
    private func addNewCourse(courseType:CourseType) -> Course {
        let course = Course(context: moc)
        course.name = courseType.rawValue
        return course
    }
}
