//
//  PhoneNumberValidator.swift
//  NurseHelper
//
//  Created by Vyacheslav Okulov on 1/31/17.
//  Copyright © 2017 Vyacheslav Okulov. All rights reserved.
//

import Foundation
import Validator

private let maxPasswordLength = 32

class PhoneNumberValidator : StringValidator {
  
  enum PhoneNumberValidatorError : Error {
    case WrongNumberFormat
  }
  
  func validate(string:String) -> StringValidationResponse {
    
    let rule = ValidationRuleLength(min: 1, max: maxPasswordLength, error: PhoneNumberValidatorError.WrongNumberFormat)
    
    let result = string.validate(rule: rule)
    
    switch result {
    case .invalid(let errors):
      return .wrongString([])
    default:
      return .properString
    }
  }
}
