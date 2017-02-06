//
//  PasswordValidator.swift
//  NurseHelper
//
//  Created by Vyacheslav Okulov on 1/30/17.
//  Copyright © 2017 Vyacheslav Okulov. All rights reserved.
//

import Foundation
import Validator

fileprivate let maxPasswordLength = 32

class PasswordValidator : StringValidator {
    
    enum PasswordValidatorError : Error {
        case WrongPassword
    }
    
    func validate(string:String) -> StringValidationResponse {
        
        var passwordRules = ValidationRuleSet<String>()

        let maxLengthRule = ValidationRuleLength(max: maxPasswordLength, error: PasswordValidatorError.WrongPassword)
        let minLengthRule = ValidationRuleLength(min: 1, error: PasswordValidatorError.WrongPassword)

        passwordRules.add(rule: maxLengthRule)
        passwordRules.add(rule: minLengthRule)
        
        let result = string.validate(rules: passwordRules)
        
        switch result {
        case .invalid(_):
            return .wrongString([])
        default:
            return .properString
        }
    }
}
