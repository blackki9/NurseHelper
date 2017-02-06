//
//  PatientsListPresenter.swift
//  NurseHelper
//
//  Created by Vyacheslav Okulov on 2/2/17.
//  Copyright (c) 2017 Vyacheslav Okulov. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol PatientsListPresenterInput {
  func presentAllPatients(response: PatientsList.Response)
}

protocol PatientsListPresenterOutput: class {
  func displayAllPatients(viewModel: PatientsList.ViewModel)
}

class PatientsListPresenter: PatientsListPresenterInput {
  weak var output: PatientsListPresenterOutput!
  
  // MARK: - Presentation logic
  
  func presentAllPatients(response: PatientsList.Response) {
    // NOTE: Format the response from the Interactor and pass the result back to the View Controller

  
  }
}
