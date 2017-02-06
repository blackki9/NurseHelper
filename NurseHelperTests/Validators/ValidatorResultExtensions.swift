//
//  ValidatorResultExtensions.swift
//  NurseHelper
//
//  Created by Vyacheslav Okulov on 1/30/17.
//  Copyright © 2017 Vyacheslav Okulov. All rights reserved.
//

import Foundation
@testable import NurseHelper

extension StringValidationResponse {
    func convertErrorToBool() -> Bool {
        var resultIsWrong = false
        switch self {
        case .wrongString(_):
            resultIsWrong = true
        default:
            break
        }
        
        return resultIsWrong
    }
    
    func convertSuccessToBool() -> Bool {
        var resultIsCorrect = false
        
        switch self {
        case .properString:
            resultIsCorrect = true
        default:
            break
        }
        
        
        return resultIsCorrect
    }
    
}
