//
//  SignInManager.swift
//  NurseHelper
//
//  Created by Vyacheslav Okulov on 1/31/17.
//  Copyright © 2017 Vyacheslav Okulov. All rights reserved.
//

import Foundation
import CoreData

typealias SignInManagerCompletion = (_ result:Bool, _ message:String) -> Void

typealias SignInManagerGetHashCompletion = (_ hashString:String?) -> Void

protocol SignInManager {
  func signIn(withEmail:String,password:String,completion: @escaping SignInManagerCompletion)
}

class SignInManagerImpl : SignInManager {
  var passwordHasher:PasswordHasher = SHAPasswordHasher()
   func signIn(withEmail: String, password: String, completion: @escaping SignInManagerCompletion) {
    //find if there is user with current email
    //validate hashes of password
    let hashForGivenPassword = passwordHasher.hashForPassword(password: password)
    hashForUser(withEmail: withEmail) { (result) in
      if result == hashForGivenPassword {
        completion(true,"")
      }
      else {
        completion(false, "Wrong email or password")
      }
    }
  }
  
}

private extension SignInManagerImpl {
  func hashForUser(withEmail:String, completion:@escaping SignInManagerGetHashCompletion) {
    CoreDataManager.shared.performForegroundTask { (context) in
      let request:NSFetchRequest<ManagedNurse> = ManagedNurse.fetchRequest()
      let predicate = NSPredicate(format: "email == %@", withEmail)
      
      request.predicate = predicate
      
      do {
        let nurses = try context.fetch(request)
        guard let nurse = nurses.first else {
          completion(nil)
          return
        }
        
        completion(nurse.password)
      }
      catch let error as NSError {
        completion(nil)
      }
      
    }
  }
}
