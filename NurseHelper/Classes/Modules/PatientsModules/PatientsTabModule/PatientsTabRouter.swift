//
//  PatientsTabRouter.swift
//  NurseHelper
//
//  Created by Vyacheslav Okulov on 2/2/17.
//  Copyright (c) 2017 Vyacheslav Okulov. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol PatientsTabRouterInput {
  func navigateToAddNewPatientScreen()
  func navigateToPatientDetailsScreen()
}

class PatientsTabRouter: PatientsTabRouterInput {
  weak var viewController: PatientsTabViewController!
  
  // MARK: - Navigation
  
  func navigateToAddNewPatientScreen() {
    viewController.performSegue(withIdentifier: "ShowAddPatients", sender: viewController)
  }
  
  func navigateToPatientDetailsScreen() {
    viewController.performSegue(withIdentifier: "ShowPatientDetails", sender: viewController)
  }
  
  // MARK: - Communication
  
  func passDataToNextScene(segue: UIStoryboardSegue) {
    // NOTE: Teach the router which scenes it can communicate with
    
    if segue.identifier == "ShowSomewhereScene" {
      passDataToSomewhereScene(segue: segue)
    }
  }
  
  func passDataToSomewhereScene(segue: UIStoryboardSegue)
  {
    // NOTE: Teach the router how to pass data to the next scene
    
    // let someWhereViewController = segue.destinationViewController as! SomeWhereViewController
    // someWhereViewController.output.name = viewController.output.name
  }
}
