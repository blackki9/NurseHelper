//
//  SignUpManager.swift
//  NurseHelper
//
//  Created by Vyacheslav Okulov on 1/31/17.
//  Copyright © 2017 Vyacheslav Okulov. All rights reserved.
//

import Foundation

typealias AddNewNurseCompletion = () -> Void

protocol SignUpManager {
  func signUpUser(withEmail:String, password:String,completion:@escaping SignUpWorkerCompletion)
}

class SignUpManagerImpl : SignUpManager {
  var hasher:PasswordHasher = SHAPasswordHasher()
  func signUpUser(withEmail:String, password:String, completion:@escaping SignUpWorkerCompletion) {
    addNewNurse(email: withEmail, password: password) {
      completion(true, "")
    }
  }
}

private extension SignUpManagerImpl {
  func addNewNurse(email:String,password:String, completion:@escaping AddNewNurseCompletion) {
    CoreDataManager.shared.performBackgroundTask({ (context) in
      let managedNurse = ManagedNurse(context: context)
      managedNurse.email = email
      let hash = self.hasher.hashForPassword(password: password)
      managedNurse.password = hash
      
      do {
        try context.save()
      }
      catch let error as NSError {
        print(error)
      }
      
      completion()
    })
  }
}
