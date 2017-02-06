//
//  StringValidator.swift
//  NurseHelper
//
//  Created by Vyacheslav Okulov on 1/30/17.
//  Copyright © 2017 Vyacheslav Okulov. All rights reserved.
//

import Foundation

enum StringValidationResponse :Error {
    case properString
    case wrongString([String])
}

protocol StringValidator {
    func validate(string:String) -> StringValidationResponse
}
