//
//  AddMedicineWorker.swift
//  NurseHelper
//
//  Created by Vyacheslav Okulov on 2/2/17.
//  Copyright (c) 2017 Vyacheslav Okulov. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

typealias AddMedicineWorkerCompletion = (_ result:Bool, _ message:String) -> Void

class AddMedicineWorker {
  // MARK: - Business Logic
  
  var medicineNameValidator:StringValidator!
  
  func addMedicine(withName name:String, completion:@escaping AddMedicineWorkerCompletion) {
    let validationResult = medicineNameValidator.validate(string: name)
    
    switch validationResult {
      case .wrongString(_):
        completion(false,"Medicine name has wrong format")
        return
      default:
        break
    }
    
    addNewMedicineToDB(withName: name, completion: completion)
  }
}

private extension AddMedicineWorker {
  func addNewMedicineToDB(withName name:String, completion:@escaping AddMedicineWorkerCompletion) {
    CoreDataManager.shared.performForegroundTask { (context) in
      let managedMedicine = ManagedMedicine(context: context)
      managedMedicine.name = name
      
      do {
        try context.save()
      }
      catch {
        completion(false, "Error when saving medicine...")
      }
      
      completion(true,"")
    }
  }
}
