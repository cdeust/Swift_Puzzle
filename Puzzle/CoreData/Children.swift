//
//  Children.swift
//  Puzzle
//
//  Created by User on 23/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import CoreData

public class Children: NSManagedObject {
    public class func fetchChildrenWithUid(uid: String, managedObjectContext: NSManagedObjectContext) -> NSArray
    {
        let fetchRequest = NSFetchRequest<Children>(entityName: "Children")
        let predicate = NSPredicate(format: "uid == \"\(uid)\"")
        fetchRequest.predicate = predicate
        
        var results = NSArray()
        do
        {
            results = try managedObjectContext.fetch(fetchRequest) as NSArray!
            return results
        }
        catch let error as NSError
        {
            print("Fetch failed: \(error.localizedDescription)")
        }
        
        return results
    }
    
    public class func fetchChildrenWithFirstname(firstname: String, lastname: String, managedObjectContext: NSManagedObjectContext) -> NSArray
    {
        let fetchRequest = NSFetchRequest<Children>(entityName: "Children")
        let predicate = NSPredicate(format: "firstname == \"\(firstname)\" && lastname == \"\(lastname)\"")
        fetchRequest.predicate = predicate
        
        var results = NSArray()
        do
        {
            results = try managedObjectContext.fetch(fetchRequest) as NSArray!
            return results
        }
        catch let error as NSError
        {
            print ("Fetch failed \(error.localizedDescription)")
        }
        
        return results
    }
    
    public class func createChildrenWithUid(uid: String, email: String, firstname: String, lastname: String, sex: String, birthdate: String, role: String, managedObjectContext: NSManagedObjectContext) -> Void
    {
        let managedObject: NSManagedObject = NSEntityDescription.insertNewObject(forEntityName: "Children", into: managedObjectContext)
        managedObject.setValue(email, forKey: "email")
        managedObject.setValue(firstname, forKey: "firstname")
        managedObject.setValue(lastname, forKey: "lastname")
        managedObject.setValue(sex, forKey: "sex")
        managedObject.setValue(birthdate, forKey: "birthdate")
        managedObject.setValue(role, forKey: "role")
        managedObject.setValue(uid, forKey: "uid")
        
        do
        {
            try managedObjectContext.save()
        }
        catch let error as NSError
        {
            print("Save failed: \(error.localizedDescription)")
        }
    }
    
    public class func updateChildrenWithUid(uid: String, email: String, firstname: String, lastname: String, sex: String, birthdate: String, role: String, managedObjectContext: NSManagedObjectContext, managedObject: NSManagedObject) -> Void
    {
        managedObject.setValue(email, forKey: "email")
        managedObject.setValue(firstname, forKey: "firstname")
        managedObject.setValue(lastname, forKey: "lastname")
        managedObject.setValue(sex, forKey: "sex")
        managedObject.setValue(birthdate, forKey: "birthdate")
        managedObject.setValue(role, forKey: "role")
        managedObject.setValue(uid, forKey: "uid")
        
        do
        {
            try managedObjectContext.save()
        }
        catch let error as NSError
        {
            print("Save failed: \(error.localizedDescription)")
        }
    }
    public class func deleteChildrenWithManagedObject(managedObject:NSManagedObject, managedObjectContext:NSManagedObjectContext) -> Void
    {
        managedObjectContext.delete(managedObject)
        
        do
        {
            try managedObjectContext.save()
        }
        catch let error as NSError
        {
            print ("Delete failed: \(error.localizedDescription)")
        }
    }
}
