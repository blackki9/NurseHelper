//
//  SignUpPresenter.swift
//  NurseHelper
//
//  Created by Vyacheslav Okulov on 1/30/17.
//  Copyright (c) 2017 Vyacheslav Okulov. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol SignUpPresenterInput {
  func presentErrorMessage(response: SignUp.Response)
  func presentPageAfterSignUp()
}

protocol SignUpPresenterOutput: class {
  func displayErrorMessage(viewModel: SignUp.ViewModel)
  func displayPageAfterSignUp()
}

class SignUpPresenter: SignUpPresenterInput {
  weak var output: SignUpPresenterOutput!
  
  // MARK: - Presentation logic
  
  func presentErrorMessage(response: SignUp.Response) {
    let viewModel = SignUp.ViewModel(messageToShow: response.resultMessage)
    output.displayErrorMessage(viewModel: viewModel)
  }
  
  func presentPageAfterSignUp() {
    output.displayPageAfterSignUp()
  }
}
