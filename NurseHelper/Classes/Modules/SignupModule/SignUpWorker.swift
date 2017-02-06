//
//  SignUpWorker.swift
//  NurseHelper
//
//  Created by Vyacheslav Okulov on 1/30/17.
//  Copyright (c) 2017 Vyacheslav Okulov. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

typealias SignUpWorkerCompletion = (_ result:Bool, _ message:String) -> Void

protocol SignUpWorkerDataSource {
  func signUpUser(withEmail:String, password:String, completion:@escaping SignUpWorkerCompletion)
}

class SignUpWorker {
  
  var dataSource:SignUpWorkerDataSource?
  var emailValidator:StringValidator!
  var passwordValidator:StringValidator!
  
  // MARK: - Business Logic
  
  func signUp(email:String, password:String, completion:@escaping SignUpWorkerCompletion) {
    let emailValidationResult = emailValidator.validate(string: email)
    let passwordValidationResult = passwordValidator.validate(string: password)
    
    switch emailValidationResult {
    case .wrongString(let errors):
      completion(false, "Email has wrong format")
      return
    default:
      break
    }
    
    switch passwordValidationResult {
    case .wrongString(let errors):
      completion(false, "Password has wrong format")
      return
    default:
      break
    }
    
    dataSource?.signUpUser(withEmail: email, password: password, completion: { (result, message) in
        completion(result,message)
    })
  }

}
