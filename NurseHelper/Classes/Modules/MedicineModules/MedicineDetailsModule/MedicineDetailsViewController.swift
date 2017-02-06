//
//  MedicineDetailsViewController.swift
//  NurseHelper
//
//  Created by Vyacheslav Okulov on 2/2/17.
//  Copyright (c) 2017 Vyacheslav Okulov. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol MedicineDetailsViewControllerInput
{
  func displaySomething(viewModel: MedicineDetails.Something.ViewModel)
}

protocol MedicineDetailsViewControllerOutput
{
  func doSomething(request: MedicineDetails.Something.Request)
}

class MedicineDetailsViewController: UIViewController, MedicineDetailsViewControllerInput
{
  var output: MedicineDetailsViewControllerOutput!
  var router: MedicineDetailsRouter!
  
  // MARK: - Object lifecycle
  
  override func awakeFromNib()
  {
    super.awakeFromNib()
    MedicineDetailsConfigurator.sharedInstance.configure(viewController: self)
  }
  
  // MARK: - View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    doSomethingOnLoad()
  }
  
  // MARK: - Event handling
  
  func doSomethingOnLoad()
  {
    // NOTE: Ask the Interactor to do some work
    
    let request = MedicineDetails.Something.Request()
    output.doSomething(request: request)
  }
  
  // MARK: - Display logic
  
  func displaySomething(viewModel: MedicineDetails.Something.ViewModel)
  {
    // NOTE: Display the result from the Presenter
    
    // nameTextField.text = viewModel.name
  }
}
