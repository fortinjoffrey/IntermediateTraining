//
//  CoreDataManager.swift
//  IntermediateTraining
//
//  Created by Joffrey Fortin on 06/03/2018.
//  Copyright © 2018 myCode. All rights reserved.
//

import CoreData

struct CoreDataManager {
    static let shared = CoreDataManager() // will live forever
    let persistentContainer: NSPersistentContainer = {
    
        let container = NSPersistentContainer(name: "IntermediateTrainingModels")
        container.loadPersistentStores { (storeDescription, err) in
            if let err = err {
                fatalError("Loading of store failed: \(err)")
            }
        }
        return container
    }()
    
    func fetchCompanies() -> [Company] {
        
        let context = persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<Company>(entityName: "Company")
        do {
            let companies = try context.fetch(fetchRequest)
            return companies
        } catch let fetchErr {
            print("Failed to fetch companies:", fetchErr)
            return []
        }        
    }
    
    func createEmployee(employeeName: String, employeeType: String,birthday: Date, company: Company) -> (Employee?, Error?) {
        
        let context = persistentContainer.viewContext
    
        let employee = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context) as! Employee
        
        employee.company = company
        employee.type = employeeType
        // create an employee
        
//        let company = Company(context: context)
//        company.employees
//
//        employee.company
        
        
        employee.setValue(employeeName, forKey: "fullName")
        
        let employeeInformation = NSEntityDescription.insertNewObject(forEntityName: "EmployeeInformation", into: context) as! EmployeeInformation
        
        employeeInformation.taxid = "456"
        employeeInformation.birthday = birthday
        
        employee.employeeInformation = employeeInformation
        
        do {
            try context.save()
            return (employee, nil)
        } catch let err {
            print("Failed to create employee:", err)
            return (nil, err)
        }
       
        
    }
    
    
}
