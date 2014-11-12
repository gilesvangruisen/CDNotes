//
//  Note.swift
//  CDNotes
//
//  Created by Giles Van Gruisen on 11/11/14.
//  Copyright (c) 2014 Giles Van Gruisen. All rights reserved.
//

import Foundation
import CoreData

class Note: NSManagedObject {

    @NSManaged var text: String
    @NSManaged var time: NSDate

    class func entityName() -> String {
        return "Note"
    }

    class func insertNewObject(managedObjectContext: NSManagedObjectContext!) -> Note! {
        return NSEntityDescription.insertNewObjectForEntityForName(entityName(), inManagedObjectContext: managedObjectContext) as Note
    }

    class func fetchNotes(managedObjectContext: NSManagedObjectContext!) -> [NoteViewModel]? {
        let entityDescription = NSEntityDescription.entityForName(entityName(), inManagedObjectContext: managedObjectContext)
        let requestTemplate = managedObjectContext.persistentStoreCoordinator?.managedObjectModel.fetchRequestTemplateForName("Notes")!
        var request: NSFetchRequest = requestTemplate?.copy() as NSFetchRequest

        request.sortDescriptors = [NSSortDescriptor(key: "time", ascending: false)]

        var error: NSError?
        let notes = managedObjectContext.executeFetchRequest(request, error: &error)

        let noteViewModels = notes?.map({ (object: AnyObject) -> NoteViewModel in
            return NoteViewModel(note: object as Note)
        })

        if let error = error {
            println("Fetch error: \(error)")
            return []
        } else {
            return noteViewModels
        }
    }

}
