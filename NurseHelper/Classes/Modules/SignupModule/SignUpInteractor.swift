//
//  SignUpInteractor.swift
//  NurseHelper
//
//  Created by Vyacheslav Okulov on 1/30/17.
//  Copyright (c) 2017 Vyacheslav Okulov. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol SignUpInteractorInput {
  func signUp(request: SignUp.Request)
}

protocol SignUpInteractorOutput {
  func presentErrorMessage(response: SignUp.Response)
  func presentPageAfterSignUp()
}

class SignUpInteractor: SignUpInteractorInput {
  var output: SignUpInteractorOutput!
  var worker: SignUpWorker!
  
  // MARK: - Business logic
  
  func signUp(request: SignUp.Request) {
    let worker = SignUpWorker()
    worker.emailValidator = EmailValidator()
    worker.passwordValidator = PasswordValidator()
    worker.dataSource = SignUpManagerImpl()
    worker.signUp(email: request.email, password: request.password) { (result, message) in
      DispatchQueue.main.async {
        if(result) {
          self.output.presentPageAfterSignUp()
        }
        else {
          let response = SignUp.Response(success: result, resultMessage: message)
          self.output.presentErrorMessage(response: response)
        }
      }
      
    }
  }
}

extension SignUpManagerImpl : SignUpWorkerDataSource {
  
}
