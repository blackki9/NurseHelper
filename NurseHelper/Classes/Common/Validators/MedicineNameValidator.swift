//
//  MedicineNameValidator.swift
//  NurseHelper
//
//  Created by Vyacheslav Okulov on 1/30/17.
//  Copyright © 2017 Vyacheslav Okulov. All rights reserved.
//

import Foundation
import Validator

fileprivate let maxMedicineNameLength = 254

class MedicineNameValidator : StringValidator {
    
    enum MedicineNameValidatorError : Error {
        case WrongMedicineName
    }
    
    func validate(string: String) -> StringValidationResponse {
        
        let rule = ValidationRuleLength(min: 1, max: maxMedicineNameLength, error: MedicineNameValidatorError.WrongMedicineName)
        
        let result = string.validate(rule: rule)
        
        switch result {
        case .valid:
            return .properString
        default:
            return .wrongString([])
        }
    }
}
