//
//  SignInConfigurator.swift
//  NurseHelper
//
//  Created by Vyacheslav Okulov on 1/30/17.
//  Copyright (c) 2017 Vyacheslav Okulov. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

// MARK: - Connect View, Interactor, and Presenter

extension SignInViewController: SignInPresenterOutput {
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    router.passDataToNextScene(segue: segue)
  }
}

extension SignInInteractor: SignInViewControllerOutput {
}

extension SignInPresenter: SignInInteractorOutput {
}

class SignInConfigurator {
  // MARK: - Object lifecycle
  
  static let sharedInstance = SignInConfigurator()
  
  private init() {}
  
  // MARK: - Configuration
  
  func configure(viewController: SignInViewController) {
    let router = SignInRouter()
    router.viewController = viewController
    
    let presenter = SignInPresenter()
    presenter.output = viewController
    
    let interactor = SignInInteractor()
    interactor.output = presenter
    
    viewController.output = interactor
    viewController.router = router
  }
}
