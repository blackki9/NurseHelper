//
//  FullNameValidator.swift
//  NurseHelper
//
//  Created by Vyacheslav Okulov on 1/30/17.
//  Copyright © 2017 Vyacheslav Okulov. All rights reserved.
//

import Foundation
import Validator

class FullNameValidator : StringValidator {
    
    enum FullNameValidatorError : Error {
        case WrongFullName
    }
    
    func validate(string:String) -> StringValidationResponse {
        
        let rule = ValidationRuleLength(min: 1, max: 128, error: FullNameValidatorError.WrongFullName)
        
        let result = string.validate(rule: rule)
        
        switch result {
        case .invalid(_):
            return .wrongString([])
        default:
            return .properString
        }
    }
}
