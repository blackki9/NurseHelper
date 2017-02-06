//
//  AddPatientViewController.swift
//  NurseHelper
//
//  Created by Vyacheslav Okulov on 2/2/17.
//  Copyright (c) 2017 Vyacheslav Okulov. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol AddPatientViewControllerInput {
  func displayErrorMessage(viewModel: AddPatient.ViewModel)
  func displayListScreen()
}

protocol AddPatientViewControllerOutput {
  func addNewPatient(request: AddPatient.Request)
}

class AddPatientViewController: UIViewController, AddPatientViewControllerInput {
  var output: AddPatientViewControllerOutput!
  var router: AddPatientRouter!
  
  @IBOutlet weak var phoneField: UITextField!
  @IBOutlet weak var fullNameField: UITextField!
  @IBOutlet weak var emailField: UITextField!
  
  // MARK: - Object lifecycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
    AddPatientConfigurator.sharedInstance.configure(viewController: self)
  }
  
  // MARK: - View lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: - Event handling

  @IBAction func cancel(_ sender: Any) {
    router.navigateToPatientsList()
  }
  
  @IBAction func savePatient(_ sender: Any) {
    let request =  AddPatient.Request(email: emailField.text ?? "", fullName: fullNameField.text ?? "", phone: phoneField.text ?? "")
    output.addNewPatient(request: request)
  }
  
  // MARK: - Display logic
  
  func displayErrorMessage(viewModel: AddPatient.ViewModel) {
    
  }
  
  func displayListScreen() {
      router.navigateToPatientsList()
  }

}