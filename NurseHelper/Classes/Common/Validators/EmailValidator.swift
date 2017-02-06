//
//  EmailValidator.swift
//  NurseHelper
//
//  Created by Vyacheslav Okulov on 1/30/17.
//  Copyright © 2017 Vyacheslav Okulov. All rights reserved.
//

import Foundation
import Validator

fileprivate let maxEmailLength = 254

class EmailValidator : StringValidator {
  
    enum EmailValidatorError : Error {
        case WrongEmail
    }
    
    func validate(string:String) -> StringValidationResponse {
        let rule = ValidationRulePattern(pattern: EmailValidationPattern.standard, error: EmailValidatorError.WrongEmail)
        let maxLengthRule = ValidationRuleLength(min: 1, max: maxEmailLength, error: EmailValidatorError.WrongEmail)
        
        var rulesSet = ValidationRuleSet<String>()
        rulesSet.add(rule: rule)
        rulesSet.add(rule: maxLengthRule)
        
        let result = string.validate(rules: rulesSet)
        
        switch result {
        case .valid:
            return .properString
        case .invalid( _):
            return .wrongString([])
        }        
    }
 
}
