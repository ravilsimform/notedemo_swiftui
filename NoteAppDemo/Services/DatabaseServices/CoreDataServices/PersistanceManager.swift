//
//  PersistanceManager.swift
//  NoteAppDemo
//
//  Created by Ravi Lakhtariya on 24/08/23.
//
import CoreData
import Foundation

final class PersistanceManager {
    private init(){}
    
    static let shared = PersistanceManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
          let container = NSPersistentContainer(name: "NoteApp")
          container.loadPersistentStores(completionHandler: { (storeDescription, error) in
              if let error = error as NSError? {
                  fatalError("Unresolved error \(error), \(error.userInfo)")
              }
          })
          return container
      }()
    
    lazy var context = persistentContainer.viewContext
    
    
    func saveContext() -> Bool {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nsError = error as NSError
                debugPrint(nsError)
                return false
            }
            return true
        }
        return false
    }
    
    func fetch<T:NSManagedObject>(managedObject: T.Type) -> [T]? {
        do {
            guard let result = try PersistanceManager.shared.context.fetch(managedObject.fetchRequest()) as? [T] else { return nil }
            return result
        } catch let error {
            debugPrint(error)
            return nil
        }
    }
}
