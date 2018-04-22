//
//  User.swift
//  Puzzle
//
//  Created by User on 23/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import CoreData

public class User: NSManagedObject {
    public class func fetchUserWithUid(uid: String, managedObjectContext: NSManagedObjectContext) -> NSArray {
        let fetchRequest = NSFetchRequest<User>(entityName: "User")
        let predicate = NSPredicate(format: "uid == \"\(uid)\"")
        fetchRequest.predicate = predicate
        
        var results = NSArray()
        do {
            results = try managedObjectContext.fetch(fetchRequest) as NSArray!
            return results
        } catch let error as NSError {
            print("Fetch failed: \(error.localizedDescription)")
        }
        
        return results
    }
    
    public class func fetchUserWithPassword(password:String, managedObjectContext: NSManagedObjectContext) -> NSArray {
        let fetchRequest = NSFetchRequest<User>(entityName: "User")
        let predicate = NSPredicate(format: "password == \"\(password)\"")
        fetchRequest.predicate = predicate
        
        
        var results = NSArray()
        do {
            results = try managedObjectContext.fetch(fetchRequest) as NSArray!
            return results
        } catch let error as NSError {
            print("Fetch failed: \(error.localizedDescription)")
        }
        
        return results
    }
    
    public class func fetchUserWithEmail(email: String, managedObjectContext: NSManagedObjectContext) -> NSArray {
        let fetchRequest = NSFetchRequest<User>(entityName: "User")
        let predicate = NSPredicate(format: "email == \"\(email)\"")
        fetchRequest.predicate = predicate
        
        var results = NSArray()
        do {
            results = try managedObjectContext.fetch(fetchRequest) as NSArray!
            return results
        } catch let error as NSError {
            print("Fetch failed: \(error.localizedDescription)")
        }
        
        return results
    }
    
    public class func fetchUserWithEmail(email: String, password: String, managedObjectContext: NSManagedObjectContext) -> NSArray {
        let fetchRequest = NSFetchRequest<User>(entityName: "User")
        let predicate = NSPredicate(format: "email == \"\(email)\" && password == \"\(password)\"")
        fetchRequest.predicate = predicate
        
        var results = NSArray()
        do {
            results = try managedObjectContext.fetch(fetchRequest) as NSArray!
            return results
        } catch let error as NSError {
            print("Fetch failed: \(error.localizedDescription)")
        }
        
        return results
    }
    
    public class func createUserWithUid(uid: String, email: String, firstname: String, lastname: String, lock: String, password: String, role: String, managedObjectContext: NSManagedObjectContext) -> Void {
        let managedObject: NSManagedObject = NSEntityDescription.insertNewObject(forEntityName: "User", into: managedObjectContext)
        managedObject.setValue(email, forKey: "email")
        managedObject.setValue(firstname, forKey: "firstname")
        managedObject.setValue(lastname, forKey: "lastname")
        managedObject.setValue(lock, forKey: "lock")
        managedObject.setValue(password, forKey: "password")
        managedObject.setValue(role, forKey: "role")
        managedObject.setValue(uid, forKey: "uid")
        
        do {
            try managedObjectContext.save()
        } catch let error as NSError {
            print("Save failed: \(error.localizedDescription)")
        }
    }
    
    public class func updateUserWithUid(uid: String, email: String, firstname: String, lastname: String, lock: String, password: String, role: String, managedObjectContext: NSManagedObjectContext, managedObject: NSManagedObject) -> Void {
        managedObject.setValue(email, forKey: "email")
        managedObject.setValue(firstname, forKey: "firstname")
        managedObject.setValue(lastname, forKey: "lastname")
        managedObject.setValue(lock, forKey: "lock")
        managedObject.setValue(password, forKey: "password")
        managedObject.setValue(role, forKey: "role")
        managedObject.setValue(uid, forKey: "uid")
        
        do {
            try managedObjectContext.save()
        } catch let error as NSError {
            print("Save failed: \(error.localizedDescription)")
        }
    }
    
    public class func deleteUserWithManagedObject(managedObject:NSManagedObject, managedObjectContext:NSManagedObjectContext) -> Void {
        managedObjectContext.delete(managedObject)
        
        do {
            try managedObjectContext.save()
        } catch let error as NSError {
            print ("Delete failed: \(error.localizedDescription)")
        }
    }
}
