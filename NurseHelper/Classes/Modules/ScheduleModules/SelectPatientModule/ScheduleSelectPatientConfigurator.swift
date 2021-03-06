//
//  ScheduleSelectPatientConfigurator.swift
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

extension ScheduleSelectPatientViewController: ScheduleSelectPatientPresenterOutput
{
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    router.passDataToNextScene(segue: segue)
  }
}

extension ScheduleSelectPatientInteractor: ScheduleSelectPatientViewControllerOutput
{
}

extension ScheduleSelectPatientPresenter: ScheduleSelectPatientInteractorOutput
{
}

class ScheduleSelectPatientConfigurator
{
  // MARK: - Object lifecycle
  
  static let sharedInstance = ScheduleSelectPatientConfigurator()
  
  private init() {}
  
  // MARK: - Configuration
  
  func configure(viewController: ScheduleSelectPatientViewController)
  {
    let router = ScheduleSelectPatientRouter()
    router.viewController = viewController
    
    let presenter = ScheduleSelectPatientPresenter()
    presenter.output = viewController
    
    let interactor = ScheduleSelectPatientInteractor()
    interactor.output = presenter
    
    viewController.output = interactor
    viewController.router = router
  }
}
