//
//  CoreDataManager.swift
//  NurseHelper
//
//  Created by Vyacheslav Okulov on 1/31/17.
//  Copyright © 2017 Vyacheslav Okulov. All rights reserved.
//

import Foundation
import CoreData

final class CoreDataManager {
  static let shared = CoreDataManager()
  
  var errorHandler:(Error) -> Void = {_ in }
  lazy var persistentContainer:NSPersistentContainer = {
    let container = NSPersistentContainer(name: "NurseHelper")
    container.loadPersistentStores(completionHandler: { [weak self](storeDescription, error) in
      if let error = error {
        print("Core data error")
        self?.errorHandler(error)
      }
    })
    
    return container
  }()
  
  lazy var viewContext:NSManagedObjectContext = {
    let viewContext = self.persistentContainer.viewContext
    viewContext.automaticallyMergesChangesFromParent = true
    return viewContext
  }()
  
  lazy var backgroundContext:NSManagedObjectContext = {
    return self.persistentContainer.newBackgroundContext()
  }()
  
  func performForegroundTask(_ block: @escaping (NSManagedObjectContext) -> Void) {
    self.viewContext.perform {
      block(self.viewContext)
    }
  }
  
  func performBackgroundTask(_ block: @escaping (NSManagedObjectContext) -> Void) {
    self.persistentContainer.performBackgroundTask(block)
  }
}
