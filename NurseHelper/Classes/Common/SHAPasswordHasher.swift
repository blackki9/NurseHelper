//
//  SHAPasswordHasher.swift
//  NurseHelper
//
//  Created by Vyacheslav Okulov on 2/2/17.
//  Copyright © 2017 Vyacheslav Okulov. All rights reserved.
//

import Foundation
import CryptoSwift

class SHAPasswordHasher : PasswordHasher {
  func hashForPassword(password: String) -> String? {
    return password.sha256()
  }
}
