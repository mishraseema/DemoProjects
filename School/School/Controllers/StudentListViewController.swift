//
//  StudentListViewController.swift
//  School
//
//  Created by Seema Pandey on 01/02/21.
//

import UIKit
import CoreData

class StudentListViewController: UITableViewController {

    var moc:NSManagedObjectContext?{
        didSet {
            if let moc = moc {
                studentService = StudentService(moc: moc)
            }
        }
    }
    
    private var studentService:StudentService?
    private var students = [Student]()
    private var studentToUpdate:Student?
    override func viewDidLoad() {
        super.viewDidLoad()
        loadRecords()
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return students.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = students[indexPath.row].name
        cell.detailTextLabel?.text = students[indexPath.row].course?.name

        return cell
    }
    
    //MARK: - TableView Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        studentToUpdate = students[indexPath.row]
        present(alertController(actionType: "Update"), animated: true, completion: nil)
    }
  
    @IBAction func addStudent(_ sender: Any) {
        present(alertController(actionType: "add"), animated: true, completion: nil)
    }
    
    // MARK: - Private
    
    private func alertController(actionType:String) -> UIAlertController {
        let alertController = UIAlertController(title: "Course", message: "Student Info", preferredStyle: .alert)
        alertController.addTextField { [weak self] (textField:UITextField) in
            textField.placeholder = "Name"
            textField.text = self?.studentToUpdate?.name ?? ""
        }
        alertController.addTextField { [weak self] (textField:UITextField) in
            textField.placeholder = "Course Type: Photography | Drawing"
            textField.text = self?.studentToUpdate?.course?.name ?? ""
        }
        let defaultAction = UIAlertAction( title: actionType.uppercased(), style: .default) { [weak self] (action) in
            
            guard let studentName = alertController.textFields?[0].text, let course = alertController.textFields?[1].text else {
                return
            }
            
            if actionType.caseInsensitiveCompare("add") == .orderedSame {
                if let courseType = CourseType(rawValue: course.lowercased()){
                    self?.studentService?.addStudent(name: studentName, for: courseType, completion: { (success, students) in
                        if success {
                            self?.students = students
                        }
                    })
                }
                
            } else if actionType.caseInsensitiveCompare("update") == .orderedSame{
                guard let name = alertController.textFields?.first?.text, !name.isEmpty, let studentToUpdate = self?.studentToUpdate, let courseT = alertController.textFields?[1].text else { return }
                self?.studentService?.update(currentStudent:studentToUpdate, withName: name , forCourse: courseT)
                self?.studentToUpdate = nil
            }
            
            DispatchQueue.main.async {
                self?.loadRecords()
            }
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (action) in
            
        }
        
        alertController.addAction(defaultAction)
        alertController.addAction(cancelAction)
        return alertController
    }
    
    private func loadRecords(){
        if let records = studentService?.getAllStudent(){
            self.students = records
            self.tableView.reloadData()
        }
    }
    
    
}
