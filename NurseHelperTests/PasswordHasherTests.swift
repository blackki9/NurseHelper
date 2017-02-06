//
//  PasswordHasherTests.swift
//  NurseHelper
//
//  Created by Vyacheslav Okulov on 2/2/17.
//  Copyright © 2017 Vyacheslav Okulov. All rights reserved.
//

@testable import NurseHelper
import XCTest

class PasswordHasherTests: XCTestCase {
  
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSHAHasher() {
      let expectedHash = "8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92"
      let password = "123456"
      
      let hasher = SHAPasswordHasher()
      
      let resultHash = hasher.hashForPassword(password: password)
      
      XCTAssertTrue(expectedHash == resultHash)
    }
    
}
