//
//  ScheduleListInteractor.swift
//  NurseHelper
//
//  Created by Vyacheslav Okulov on 2/2/17.
//  Copyright (c) 2017 Vyacheslav Okulov. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol ScheduleListInteractorInput
{
  func doSomething(request: ScheduleList.Something.Request)
}

protocol ScheduleListInteractorOutput
{
  func presentSomething(response: ScheduleList.Something.Response)
}

class ScheduleListInteractor: ScheduleListInteractorInput
{
  var output: ScheduleListInteractorOutput!
  var worker: ScheduleListWorker!
  
  // MARK: - Business logic
  
  func doSomething(request: ScheduleList.Something.Request)
  {
    // NOTE: Create some Worker to do the work
    
    worker = ScheduleListWorker()
    worker.doSomeWork()
    
    // NOTE: Pass the result to the Presenter
    
    let response = ScheduleList.Something.Response()
    output.presentSomething(response: response)
  }
}
