//
//  MedicineDetailsConfigurator.swift
//  NurseHelper
//
//  Created by Vyacheslav Okulov on 2/2/17.
//  Copyright (c) 2017 Vyacheslav Okulov. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

// MARK: - Connect View, Interactor, and Presenter

extension MedicineDetailsViewController: MedicineDetailsPresenterOutput
{
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    router.passDataToNextScene(segue: segue)
  }
}

extension MedicineDetailsInteractor: MedicineDetailsViewControllerOutput
{
}

extension MedicineDetailsPresenter: MedicineDetailsInteractorOutput
{
}

class MedicineDetailsConfigurator
{
  // MARK: - Object lifecycle
  
  static let sharedInstance = MedicineDetailsConfigurator()
  
  private init() {}
  
  // MARK: - Configuration
  
  func configure(viewController: MedicineDetailsViewController)
  {
    let router = MedicineDetailsRouter()
    router.viewController = viewController
    
    let presenter = MedicineDetailsPresenter()
    presenter.output = viewController
    
    let interactor = MedicineDetailsInteractor()
    interactor.output = presenter
    
    viewController.output = interactor
    viewController.router = router
  }
}