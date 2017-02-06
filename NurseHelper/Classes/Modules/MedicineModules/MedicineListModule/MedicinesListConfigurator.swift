//
//  MedicinesListConfigurator.swift
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

extension MedicinesListViewController: MedicinesListPresenterOutput
{
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    router.passDataToNextScene(segue: segue)
  }
}

extension MedicinesListInteractor: MedicinesListViewControllerOutput
{
}

extension MedicinesListPresenter: MedicinesListInteractorOutput
{
}

class MedicinesListConfigurator
{
  // MARK: - Object lifecycle
  
  static let sharedInstance = MedicinesListConfigurator()
  
  private init() {}
  
  // MARK: - Configuration
  
  func configure(viewController: MedicinesListViewController)
  {
    let router = MedicinesListRouter()
    router.viewController = viewController
    
    let presenter = MedicinesListPresenter()
    presenter.output = viewController
    
    let interactor = MedicinesListInteractor()
    interactor.output = presenter
    
    viewController.output = interactor
    viewController.router = router
  }
}