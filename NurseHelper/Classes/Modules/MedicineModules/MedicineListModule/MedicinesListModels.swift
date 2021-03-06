//
//  MedicinesListModels.swift
//  NurseHelper
//
//  Created by Vyacheslav Okulov on 2/2/17.
//  Copyright (c) 2017 Vyacheslav Okulov. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

struct MedicinesList {

    struct MedicineShowItem {
      let name:String
    }
  
    struct Response {
      let items:[MedicineShowItem]
    }
    struct ViewModel {
      let items:[MedicineShowItem]
    }
}
